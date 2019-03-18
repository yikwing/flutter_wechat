import 'package:flutter/material.dart';
import 'package:flutter_redux/constants.dart';
import 'package:flutter_redux/home_found.dart';
import 'package:flutter_redux/home_me.dart';
import 'package:flutter_redux/home_wechat.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(
            0xe601,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe656,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '发现',
          icon: IconData(
            0xe600,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe671,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '我',
          icon: IconData(
            0xe6c0,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe626,
            fontFamily: Constants.IconFontFamily,
          )),
    ];

    _pages = [
      HomeWechat(),
      HomeFound(),
      HomeFound(),
      HomeMe(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: botNavBar,
    );
  }
}
