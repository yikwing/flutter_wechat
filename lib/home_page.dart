import 'package:flutter/material.dart';
import 'package:flutter_jpush/flutter_jpush.dart';
import 'package:flutter_redux/basic_appbar.dart';
import 'package:flutter_redux/constants.dart';
import 'package:flutter_redux/home_contacts.dart';
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
  bool _isScroller = true;
  int _tmp = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();

    FlutterJPush.addReceiveNotificationListener(
        (JPushNotification notification) {
      /// 收到推送
      print("收到推送提醒: ${notification.content}");
    });

    FlutterJPush.addReceiveOpenNotificationListener(
        (JPushNotification notification) {
      print("打开了推送提醒: $notification");

      /// 打开了推送提醒
    });

    FlutterJPush.addReceiveCustomMsgListener((JPushMessage msg) {
      print("收到推送消息提醒: $msg");

      /// 打开了推送提醒
    });

    _pageController = PageController(initialPage: _currentIndex);

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
      HomeContacts(),
      HomeFound(),
      HomeMe(),
    ];
  }

  Widget _changeAppbar() {
    if (_currentIndex == 3) {
      return AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      );
    } else {
      return BasicAppbar(
        title: _navigationViews[_currentIndex].item.title,
      );
    }
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
          _isScroller = false;
          _currentIndex = index;
          _tmp = index;

          _pageController.jumpToPage(
            _currentIndex,
          );
        });
      },
    );

    return Scaffold(
      appBar: _changeAppbar(),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          print(index);
          return _pages[index];
        },
        itemCount: _pages.length,
        onPageChanged: (index) {
          if (_isScroller) {
            setState(() {
              _currentIndex = index;
            });
          } else {
            if (_tmp == index) {
              setState(() {
                _isScroller = true;
              });
            }
          }
        },
        controller: _pageController,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
