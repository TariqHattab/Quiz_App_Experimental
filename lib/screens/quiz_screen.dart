import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/progress_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizScreen extends StatelessWidget {
  static const String routeName = '/quiz_screen_1';
  const QuizScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueGrey.shade900,
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [ProgressBar()],
            ),
          )
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(kDefualtRadius),
      ),
      child: GetBuilder<QuistionController>(
          init: QuistionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (ctx, constraints) {
                    var heightController = constraints.maxHeight *
                                controller.animation.value *
                                15 ==
                            constraints.maxHeight
                        ? constraints.maxHeight
                        : constraints.maxHeight *
                            controller.animation.value *
                            15;
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width:
                            constraints.maxWidth * controller.animation.value,
                        height: heightController,
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    );
                  },
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${(controller.animation.value * 60).round()} Sec'),
                        WebsafeSvg.asset('assets/icons/clock.svg'),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
