import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'constants.dart';
import 'menu.dart';
import 'onboard_pages.dart';

class OnboardPage extends StatefulWidget {
  static const String id = 'onboard_page';
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  DateTime timeBackPressed = DateTime.now();
  final controller = PageController();
  int isLastPage = 0;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,overlays: [SystemUiOverlay.top]);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: scaffoldColor(isLastPage),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index;
              });
            },
            children: [
              OnboardPages(
                  colour: kPageOneColor,
                  urlImage: 'assets/jsons/folder.json',
                  title: 'Easy to Use',
                  subtitle:
                  'Organize your files'),
              OnboardPages(
                  colour: kPageTwoColor,
                  urlImage: 'assets/jsons/diagram.json',
                  title: 'Diagram',
                  subtitle:
                  'See how much you have free space'),
              OnboardPages(
                  colour: kPageThreeColor,
                  urlImage: 'assets/jsons/ready.json',
                  title: 'Let\'s Go',
                  subtitle:
                  'We happy to see you'),
            ],
          ),
        ),
        bottomSheet: isItLastPage(isLastPage),
      ),
    );
  }

  Widget isItLastPage(int index) {
    switch (index) {
      case 0:
        return PageBottomNavigator(
            controller: controller, colour: kPageOneColor);
      case 1:

        return PageBottomNavigator(
            controller: controller, colour: kPageTwoColor);
      case 2:
        return TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            primary: Colors.white,
            backgroundColor: kPageThreeColor,
            minimumSize: const Size.fromHeight(80.0),
          ),
          child: const Text(
            'Start Now',
            style: TextStyle(
                fontSize: 45,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showMain', true);
            Navigator.pushNamedAndRemoveUntil(context, MainMenu.id, (route)=> false);
          },
        );
      default:
        return PageBottomNavigator(
          controller: controller,
          colour: kPageOneColor,
        );
    }
  }


  Color scaffoldColor (int index) {
    switch (index) {
      case 0:
        return kPageOneColor;
      case 1:
        return kPageTwoColor;
      case 2:
        return kPageThreeColor;
      default:
        return kPageOneColor;
    }
  }
}

class PageBottomNavigator extends StatelessWidget {
  const PageBottomNavigator(
      {Key? key, required this.controller, required this.colour})
      : super(key: key);

  final PageController controller;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colour,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              'SKIP',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              controller.jumpToPage(2);
            },
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                spacing: 16.0,
                dotColor: Colors.black26,
                activeDotColor: Colors.white,
              ),
              onDotClicked: (index) {
                controller.animateToPage(index,
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
          ),
          TextButton(
            child: const Text(
              'NEXT',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              controller.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInOut);
            },
          ),
        ],
      ),
    );
  }
}
