import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/look_a_look.dart';

class HomeFound extends StatefulWidget {
  final Widget child;

  HomeFound({Key key, this.child}) : super(key: key);

  _HomeFoundState createState() => _HomeFoundState();
}

class FoundItem {
  String url;
  String title;

  FoundItem(this.title, this.url);
}

class _HomeFoundState extends State<HomeFound>
    with AutomaticKeepAliveClientMixin {
  List<FoundItem> foundItem = List();

  @override
  void initState() {
    super.initState();
    foundItem
      ..add(FoundItem("朋友圈", "ic_social_circle.png"))
      ..add(FoundItem("摇一摇", "ic_shake_phone.png"))
      ..add(FoundItem("漂流瓶", "ic_bottle_msg.png"))
      ..add(FoundItem("看一看", "ic_feeds.png"))
      ..add(FoundItem("游戏", "ic_game_entry.png"))
      ..add(FoundItem("小程序", "ic_mini_program.png"));
  }

  _gotoPage(context, index) {
    Navigator.push(
      context,
      new CupertinoPageRoute<void>(
        builder: (ctx) => LookaLook(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(0),
            color: Colors.white,
            elevation: 0.0,
            child: ListTile(
              onTap: () {
                _gotoPage(context, index);
              },
              title: Text(foundItem[index].title),
              leading: Image.asset(
                'assets/images/' + foundItem[index].url,
                width: 25,
                height: 25,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          );
        },
        itemCount: foundItem.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
