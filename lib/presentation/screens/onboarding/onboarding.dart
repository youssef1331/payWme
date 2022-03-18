import 'package:flutter/material.dart';
import 'package:payment_methode/data/onboardingmodel/on_boarding_model.dart';
import 'package:payment_methode/presentation/screens/typesOfAccount/typeofaccount.dart';
import 'package:payment_methode/presentation/shared/remote/cache_helper.dart';
import 'package:payment_methode/presentation/widget/onboarding_body/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    var onboardController = PageController();
    List<OnBooardinModel> onboarding = [
      OnBooardinModel(
        'assets/images/onboarding/onboard1.jpg',
        'Title Page 1 ',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry ."
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      ),
      OnBooardinModel(
        'assets/images/onboarding/onboard2.jpg',
        'Title Page 2 ',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry ."
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      ),
      OnBooardinModel(
        'assets/images/onboarding/onboard3.jpg',
        'Title Page 3 ',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry ."
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      ),
    ];
    void finish() {
      CacheHelper.saveData(key: 'onboarding', value: true).then((value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TypesOfAccoun()),
          );
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: finish,
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: onboardController,
                onPageChanged: (index) {
                  if (index == onboarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(onboarding[index]),
                itemCount: onboarding.length,
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: onboardController,
                count: onboarding.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 18,
                  spacing: 6.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange),
                ),
                onPressed: () {
                  if (isLast == true) {
                    finish();
                  } else {
                    onboardController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                    );
                  }
                },
                child:
                    isLast == true ? const Text('Finish') : const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
