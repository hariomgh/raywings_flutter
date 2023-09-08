import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class contact_us extends StatelessWidget {
  const contact_us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white30,
        body: ContactUs(
          cardColor: Colors.white,
          textColor: Colors.teal.shade900,
          logo: const AssetImage('assets/images/img.png'),
          email: 'contact@raywingscampus.in',
          companyName: 'Raywings Learning Campus',
          companyColor: Colors.teal.shade100,
          dividerThickness: 1,
          phoneNumber: '+917310100945',
          website: 'https://raywingscampus.in/',
          linkedinURL: 'https://www.linkedin.com/company/raywings-learning-campus/mycompany/',
          tagLine: 'Revolutionizing Education',
          taglineColor: Colors.teal.shade100,
          twitterHandle: 'raywings_campus',
          instagram: 'raywingslearningcampus',
          facebookHandle: 'RaywingsLearningCampus',

        ),
      ),
    );
  }
}
