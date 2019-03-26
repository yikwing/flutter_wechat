import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/look_a_look.dart';

class Routes {
  static Router router;
  static String root = '/';
  static String look = 'look';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(look,
        handler: Handler(handlerFunc: (context, params) => LookaLook()));

    Routes.router = router;
  }
}
