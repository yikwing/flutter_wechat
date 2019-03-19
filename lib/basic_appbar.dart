import 'package:flutter/material.dart';
import 'package:flutter_redux/constants.dart';

class BasicAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;

  BasicAppbar({Key key, this.title}) : super(key: key);

  _BasicAppbarState createState() => _BasicAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class _BasicAppbarState extends State<BasicAppbar> {
  _buildPopupMunuItem(int iconName, String title) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
              IconData(
                iconName,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 22.0,
              color: const Color(AppColors.AppBarPopupMenuColor)),
          Container(width: 12.0),
          Text(title,
              style: TextStyle(
                  color: const Color(AppColors.AppBarPopupMenuColor))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[200],
      title: widget.title,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        Theme(
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe638, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe61b, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe63d, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(Icons.add_circle_outline),
            onSelected: (ActionItems selected) {
              print('点击的是$selected');
            },
          ),
          data: ThemeData(
            cardColor: Colors.black87.withOpacity(0.8),
          ),
        )
      ],
      elevation: 0.0,
    );
  }
}
