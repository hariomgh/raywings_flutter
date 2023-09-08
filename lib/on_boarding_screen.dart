import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPages(),
    );
  }
}

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({Key? key}) : super(key: key);

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {

  final controller = PageController(
    // uncomment if we want our pages to show in half screens
    // viewportFraction: 0.8,
  );
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(bottom: 80, left: 0, right: 0,),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [

            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/img.png',

              title: 'reduce',
              subtitle: 'something something something',
            ),

            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/img.png',

              title: 'reduce',
              subtitle: 'something something something',
            ),

            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/img.png',
              title: 'reduce',
              subtitle: 'something something something',
            ),


          ],
        ),
      ),
      bottomSheet: isLastPage? TextButton(
        onPressed: () async {

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.white,
          backgroundColor: Colors.teal,
          minimumSize: Size.fromHeight(80),
        ),
        child: Text('Get Started', style: TextStyle(fontSize: 24),),
      )
          :Container(

        padding: EdgeInsets.symmetric(horizontal: 0.0, ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TextButton(onPressed: () => controller.jumpToPage(2), child: Text('SKIP'),),

            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.teal.shade400,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,),
              ),
            ),

            TextButton(
              onPressed: () => controller.nextPage(
                duration: const Duration(microseconds: 300,),
                curve: Curves.easeInOut,
              ),
              child: Text('NEXT'),
            ),

          ],
        ),
      ),
    );
  }

  buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle})
  {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(height: 64,),
          Text(
            title,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

