import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScaffold extends StatefulWidget {
  const WebScaffold({
    Key key,
    this.title,
    this.titleId,
    this.url,
  }) : super(key: key);

  final String title;
  final String titleId;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return new WebScaffoldState();
  }
}

class WebScaffoldState extends State<WebScaffold> {
//  WebViewController _webViewController;
//  bool _isShowFloatBtn = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: new Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: new WebView(
        onWebViewCreated: (WebViewController webViewController) {
//          _webViewController = webViewController;
//          _webViewController.addListener(() {
//            int _scrollY = _webViewController.scrollY.toInt();
//            if (_scrollY < 480 && _isShowFloatBtn) {
//              _isShowFloatBtn = false;
//              setState(() {});
//            } else if (_scrollY > 480 && !_isShowFloatBtn) {
//              _isShowFloatBtn = true;
//              setState(() {});
//            }
//          });
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
//      floatingActionButton: _buildFloatingActionButton(),
    );
  }

//  Widget _buildFloatingActionButton() {
//    if (_webViewController == null || _webViewController.scrollY < 480) {
//      return null;
//    }
//    return new FloatingActionButton(
//        heroTag: widget.title ?? widget.titleId,
//        backgroundColor: Theme.of(context).primaryColor,
//        child: Icon(
//          Icons.keyboard_arrow_up,
//        ),
//        onPressed: () {
//          _webViewController.scrollTop();
//        });
//  }
}
