import 'package:flutter/material.dart';
import 'package:flutter_redux/model/news_list_bean.dart';
import 'package:flutter_redux/okhttp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_redux/web_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LookaLook extends StatefulWidget {
  final Widget child;

  LookaLook({Key key, this.child}) : super(key: key);

  _LookaLookState createState() => _LookaLookState();
}

class _LookaLookState extends State<LookaLook>
    with AutomaticKeepAliveClientMixin {
  List<Items> list = List();

  @override
  void initState() {
    super.initState();
    OkhttpUtil.get(
      'https://www.wanandroid.com/tools/mockapi/423/NewsList',
      (data) {
        setState(() {
          list = NewsListBean.fromJson(data).items;
        });
      },
    );
  }

  _getItems(index) {
    if (list[index].itemType == 5) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            new CupertinoPageRoute<void>(
              builder: (ctx) => new WebScaffold(
                    title: list[index].data.title,
                    url:
                        "https://api.arkcloudtech.com/api/news/h5/html?id=${list[index].data.id}",
                  ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            list[index].data.pics[0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            list[index].data.pics[1],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            list[index].data.pics[2],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                list[index].data.title,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(DateUtil.getDateStrByMs(list[index].data.createTime * 1000)),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            new CupertinoPageRoute<void>(
              builder: (ctx) => new WebScaffold(
                    title: list[index].data.title,
                    url:
                        "https://api.arkcloudtech.com/api/news/h5/html?id=${list[index].data.id}",
                  ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: list[index].data.coverImgUrl,
                width: 120,
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      list[index].data.title,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(DateUtil.getDateStrByMs(
                        list[index].data.createTime * 1000))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('精选'),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.separated(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _getItems(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
