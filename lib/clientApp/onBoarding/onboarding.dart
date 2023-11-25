import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../constant/colours.dart';
import '../splashScreen/signIn_LogIn/start 2.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String body;

  OnboardingModel(this.image, this.title, this.body);
}

class OnboadringScreen extends StatelessWidget {
  var pageController = PageController();
  List<OnboardingModel> onboardingList = [
    OnboardingModel('Images/doctor1.png',
        'Find a lot of specialist doctors in one place', 'Skip'),
    OnboardingModel(
        'Images/doctor2.png', 'Book with doctors you can trust', 'Skip'),
    OnboardingModel(
        'Images/nurse1.png', 'Save and review all of your information', 'Skip')
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageIndex = index;
                },
                physics: const BouncingScrollPhysics(),
                itemCount: onboardingList.length,
                itemBuilder: (context, index) => buildPageItem(
                  context,
                  onboardingList[index],
                ),
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: const WormEffect(
                      dotWidth: 50,
                      dotHeight: 15,
                      dotColor: Colors.grey,
                      activeDotColor: mainColour,
                    ),
                    controller: pageController,
                    count: onboardingList.length),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    if (pageIndex == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signInLogIn(),
                        ),
                      );
                    }
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.linearToEaseOut);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: mainColour,
                  child: const Text('Next',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16, height: 0.7)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPageItem(context, OnboardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Image(
                  image: AssetImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signInLogIn(),
                          ),
                          (route) => false);
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.teal,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ]),
                      child: Center(
                        child: Text(
                          model.body,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
