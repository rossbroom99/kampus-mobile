import 'package:flutter/material.dart';
import 'package:kampus/app/presentation/core/shared/text/heading_1.dart';
import 'package:kampus/app/presentation/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 7.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: LinearPercentIndicator(
                    lineHeight: 1.5.h,
                    percent: 0.5,
                    backgroundColor: canvasColor,
                    barRadius: const Radius.circular(15),
                    progressColor: primaryColor,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: const Center(child: Heading1(text: 'My\nemail is')),
            ),
          ),
          Container(
            child: const Text('Onboarding Screen'),
          ),
        ],
      ),
    ));
  }
}
