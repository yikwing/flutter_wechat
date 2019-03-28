import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/home_found.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:flutter_redux/contact_model.dart';

class HomeContacts extends StatefulWidget {
  final Widget child;

  HomeContacts({Key key, this.child}) : super(key: key);

  _HomeContactsState createState() => _HomeContactsState();
}

class _HomeContactsState extends State<HomeContacts>
    with AutomaticKeepAliveClientMixin {
  List<ContactInfo> _contacts = List();
  List<FoundItem> foundItem = List();

  int _suspensionHeight = 30;
  int _itemHeight = 60;

  @override
  void initState() {
    super.initState();

    foundItem
      ..add(FoundItem("新的朋友", "ic_new_friend.png"))
      ..add(FoundItem("群聊", "ic_group_chat.png"))
      ..add(FoundItem("标签", "ic_tag.png"))
      ..add(FoundItem("公众号", "ic_public_account.png"));

    loadData();
  }

  void loadData() {
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((value) {
        _contacts.add(ContactInfo(name: value['name']));
      });
      _handleList(_contacts);
      setState(() {});
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(list);
  }

  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: _suspensionHeight.toDouble(),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      color: Colors.grey.withOpacity(0.1),
      child: Text('$susTag'),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(model.name[0]),
            ),
            title: Text(model.name),
            onTap: () {
              print("OnItemClick: $model");
            },
          ),
        )
      ],
    );
  }

  Widget _getItem(index) {
    return ListTile(
      title: Text(foundItem[index].title),
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/' + foundItem[index].url,
            ),
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        print('object');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AzListView(
        header: AzListViewHeader(
            builder: (BuildContext context) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return _getItem(index);
                },
                itemCount: foundItem.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 0.0,
                    indent: 70,
                  );
                },
              );
            },
            height: 225),
        data: _contacts,
        itemBuilder: (context, model) => _buildListItem(model),
        isUseRealIndex: true,
        itemHeight: _itemHeight,
        suspensionHeight: _suspensionHeight,
        indexBarBuilder: (BuildContext context, List<String> tags,
            IndexBarTouchCallback onTouch) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey[300], width: .5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: IndexBar(
                data: tags,
                itemHeight: 20,
                onTouch: (details) {
                  onTouch(details);
                },
              ),
            ),
          );
        },
        indexHintBuilder: (context, hint) {
          return Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.blue[700].withAlpha(200),
              shape: BoxShape.circle,
            ),
            child: Text(hint,
                style: TextStyle(color: Colors.white, fontSize: 30.0)),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
