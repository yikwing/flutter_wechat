import 'package:flutter/material.dart';
import 'package:flutter_redux/model/conversation.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeWechat extends StatefulWidget {
  final Widget child;

  HomeWechat({Key key, this.child}) : super(key: key);

  _HomeWechatState createState() => _HomeWechatState();
}

class _HomeWechatState extends State<HomeWechat> {
  Widget _getAvater(index) {
    if (ConversationPageData.mockConversations[index].avatar
        .startsWith("assets")) {
      return Container(
          height: 53,
          width: 53,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  ConversationPageData.mockConversations[index].avatar),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ));
    } else {
      return Container(
        height: 53,
        width: 53,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                ConversationPageData.mockConversations[index].avatar),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('微信(164)'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              print("object");
            },
            title: Text(ConversationPageData.mockConversations[index].title),
            subtitle: Text(ConversationPageData.mockConversations[index].des),
            leading: _getAvater(index),
            trailing: Text(
              ConversationPageData.mockConversations[index].updateAt,
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
        itemCount: ConversationPageData.mockConversations.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
            indent: 80.0,
          );
        },
      ),
    );
  }
}
