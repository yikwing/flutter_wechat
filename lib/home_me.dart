import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/home_found.dart';

class HomeMe extends StatefulWidget {
  final Widget child;

  HomeMe({Key key, this.child}) : super(key: key);

  _HomeMeState createState() => _HomeMeState();
}

class _HomeMeState extends State<HomeMe> with AutomaticKeepAliveClientMixin {
  List<FoundItem> foundItem = List();

  @override
  void initState() {
    super.initState();
    foundItem
      ..add(FoundItem("支付", "ic_wallet.png"))
      ..add(FoundItem("", ""))
      ..add(FoundItem("收藏", "ic_collections.png"))
      ..add(FoundItem("商城", "ic_shopping.png"))
      ..add(FoundItem("卡包", "ic_cards_wallet.png"))
      ..add(FoundItem("表情", "ic_emotions.png"))
      ..add(FoundItem("", ""))
      ..add(FoundItem("设置", "ic_settings.png"));
  }

  Widget _getItem(index) {
    if (foundItem[index].title != "") {
      return Container(
        color: Colors.white,
        child: ListTile(
          title: Text(foundItem[index].title),
          leading: Image.asset(
            'assets/images/' + foundItem[index].url,
            width: 25,
            height: 25,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      );
    } else {
      return SizedBox(
        height: 10.0,
      );
    }
  }

  Widget _separatorItem(index) {
    if (foundItem[index].title != "") {
      if (index + 1 < foundItem.length && foundItem[index + 1].title != "") {
        return Divider(
          height: 0,
          indent: 60,
        );
      } else {
        return Divider(
          height: 0,
          color: Colors.white,
        );
      }
    } else {
      return Divider(
        height: 0,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 22.0, bottom: 25.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          'https://i.loli.net/2019/02/16/5c67ca84d2306.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  width: 65,
                  height: 65,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'yikWing',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          '微信号:yikwing',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return _getItem(index);
              },
              itemCount: foundItem.length,
              separatorBuilder: (BuildContext context, int index) {
                return _separatorItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
