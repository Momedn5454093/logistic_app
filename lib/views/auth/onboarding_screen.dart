import 'dart:math';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final images = [
    "assets/images/onboarding1.jpg",
    "assets/images/onboarding2.jpg",
    "assets/images/onboarding3.jpg",
  ];

  final text = [
    "Move Every shipment",
    "Track in Real-Time",
    "Reliable Delivery",
  ];

  final subTitle = ["With Confidence", "Stay in Control", "Every Time"];

  final controller = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: images.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.fill,
                height: double.infinity,
              );
            },
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff000000).withValues(alpha: 0),
                    Color(0xff000000),
                  ],
                  begin: Alignment(0, -.27),
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  images.length,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: index == images.length - 1 ? 0 : 34,
                    ),
                    child: Transform.rotate(
                      angle: index == currentPage ? pi / 4 : 0,
                      child: Container(
                        height: 9,
                        width: 9,
                        decoration: BoxDecoration(
                          color: index == currentPage
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                text[currentPage],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                subTitle[currentPage],
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 24, bottom: 48),
                child: Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .10),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(blurRadius: 6),
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Color(0xFFFFFFFF).withValues(alpha: .25),
                        blurStyle: BlurStyle.inner,
                      ),
                      BoxShadow(
                        offset: Offset(0, -3),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Color(0xFF000000).withValues(alpha: .25),
                        blurStyle: BlurStyle.inner,
                      ),
                    ],
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (currentPage == images.length - 1) {
                        controller.animateToPage(
                          0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    elevation: 0,
                    backgroundColor: Color(0xff2563EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
