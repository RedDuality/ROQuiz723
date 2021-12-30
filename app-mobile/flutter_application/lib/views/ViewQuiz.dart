import 'package:flutter/material.dart';
import 'package:roquiz/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/svg.dart';

class ViewQuizWidget extends StatelessWidget {
  const ViewQuizWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: double.infinity,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF3F4768), width: 3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) => Container(
                            // from 0 to 1 it takes 60s
                            width: constraints.maxHeight * 0.5,
                            decoration: BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      SvgPicture.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
