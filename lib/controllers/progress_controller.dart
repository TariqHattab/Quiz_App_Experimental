import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuistionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  //so that we can access our animation outside
  Animation get animation => this._animation;

  // Called immediately after the widget is allocated in memory
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward();
    super.onInit();
  }
}
