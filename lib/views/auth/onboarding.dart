import 'dart:math';

import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

int currentPage = 0;

class _OnboardingState extends State<Onboarding> {
  final images = [
    "assets/images/onboarding1.jpg",
    "assets/images/onboarding2.jpg",
    "assets/images/onboarding3.jpg",
  ];

  final texts = [
    "Move Every shipment",
    "Track in Real-Time",
    "Reliable Delivery",
  ];
  final subTitle = ["With Confidence", "Stay in Control", "Every Time"];

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: controller,
            children: [
              Image.asset(
                images[currentPage],
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),

          IgnorePointer(
            ignoring: true,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withValues(alpha: 0), Colors.black],
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
                      end: index == images.length - 1 ? 0 : 34.0,
                    ),
                    child: Transform.rotate(
                      angle: index == currentPage ? pi / 4 : 0,
                      child: Container(
                        width: 9,
                        height: 9,
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
                texts[currentPage],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subTitle[currentPage],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 14),
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 6),
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      offset: Offset(0, -3),
                      blurRadius: 4,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.inner,
                    ),
                    BoxShadow(
                      color: Colors.white.withAlpha(25),
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    if (currentPage == images.length - 1) {
                      setState(() {
                        currentPage = 0;
                      });
                    } else {
                      setState(() {
                        currentPage++;
                      });
                    }
                    controller.animateToPage(
                      currentPage,
                      duration: Duration(milliseconds: 60),
                      curve: Curves.easeIn,
                    );
                    setState(() {});
                  },

                  elevation: 0,
                  backgroundColor: Color(0xff2563EB),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
              SizedBox(height: 14),
            ],
          ),
        ],
      ),
    );
  }
}
