import 'package:flutter/material.dart';

class TransparentPageRoute<T> extends ModalRoute<T> {
  final Widget Function(BuildContext context) builder;

  TransparentPageRoute(this.builder);

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(seconds: 0);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }
}
