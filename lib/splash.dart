import 'package:flutter/material.dart';
import 'package:flutter_jpush/flutter_jpush.dart';
import 'package:flutter_redux/home_page.dart';

class SplashPage extends StatefulWidget {
  final Widget child;

  SplashPage({Key key, this.child}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  bool isConnected = false;
  String registrationId;
  List notificationList = [];

  @override
  void initState() {
    super.initState();

    _startupJpush();

    FlutterJPush.addConnectionChangeListener((bool connected) {
      setState(() {
        /// 是否连接，连接了才可以推送
        print("连接状态改变:$connected");
        this.isConnected = connected;
        if (connected) {
          FlutterJPush.getRegistrationID().then((String regId) {
            print("主动获取设备号:$regId");
            setState(() {
              this.registrationId = regId;
            });
          });
        }
      });
    });

    FlutterJPush.addnetworkDidLoginListener((String registrationId) {
      setState(() {
        /// 用于推送
        print("收到设备号:$registrationId");
        this.registrationId = registrationId;
      });
    });

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (route) => route == null);
      }
    });

    _controller.forward();
  }

  void _startupJpush() async {
    print("初始化jpush");
    await FlutterJPush.startup();
    print("初始化jpush成功");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/images/splash.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
