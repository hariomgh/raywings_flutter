import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:raywings_flutter/login_page.dart';
import 'package:raywings_flutter/registration.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {

  final String phoneNumber;
  final String countryCode;

  const OtpScreen({Key? key, required this.phoneNumber, required this.countryCode}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Color borderColor = Color(0xFF800000);
  bool isTimerRunning = false;
  int countdownSeconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
    _sendOTP();
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      isTimerRunning = true;
    });

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        countdownSeconds--;
        if (countdownSeconds <= 0) {
          timer.cancel();
          isTimerRunning = false;
          countdownSeconds = 30;
        }
      });
    });
  }

  void _sendOTP() async {
    // Construct the API URL
    String apiUrl = 'https://raywingslearningapp.institute.org.in/api/public/send-otp';

    // Construct the request body
    Map<String, dynamic> requestBody = {
      // 'countryCode': widget.countryCode,
      // 'phoneNumber': widget.phoneNumber,
      'username': widget.phoneNumber,
    };

    try {
      // Make the POST request
      http.Response response = await http.post(
          Uri.parse(apiUrl), body: requestBody);

      // Check the response status code
      if (response.statusCode == 200) {
        // Success: OTP sent
        print('OTP sent to ${widget.phoneNumber}');
      } else {
        // Error: OTP not sent
        print('Failed to send OTP. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred during the request
      print('Error sending OTP: $e');
    }
  }


  void _verifyOTP(String otp) async {
    // Construct the API URL
    String apiUrl = 'https://raywingslearningapp.institute.org.in/api/public/user/verify-otp';

    // Construct the request body
    Map<String, dynamic> requestBody = {
      'user': widget.phoneNumber,
      'otpData': otp,
    };

    try {
      // Make the POST request
      http.Response response = await http.post(Uri.parse(apiUrl), body: requestBody);

      // Check the response status code
      if (response.statusCode == 200) {
        // Success: OTP verified
        print('OTP verified for ${widget.phoneNumber}');
        // Navigate to the next screen (e.g., registration screen)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentForm()),
        );
      } else {
        // Error: OTP not verified
        print('OTP verification failed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred during the request
      print('Error verifying OTP: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract the last 4 digits of the phoneNumber
    String lastFourDigits = widget.phoneNumber.substring(widget.phoneNumber.length - 4);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Verify', style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                Text('We have sent a 4 digit OTP to',
                    style: TextStyle(fontSize: 15)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      '${widget.countryCode} *** *** $lastFourDigits',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          height: 1.2,
                          fontFamily: 'Dubai',
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));

                      },
                      child: Text(
                        'Edit Number',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),


                OtpTextField(
                  numberOfFields: 4,
                  borderColor: Color(0xff800000),
                  focusedBorderColor: Color(0xff800000),
                  // Set the focused border color to red
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    _verifyOTP(verificationCode);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 20),
                Visibility(
                  visible: !isTimerRunning,
                  // Show when the timer is not running
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the otp",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            height: 1.2,
                            fontFamily: 'Dubai',
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          // Start the timer and sends otp again when "send again" is pressed
                          startTimer();
                          _sendOTP();
                        },
                        child: const Text(
                          'send again',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isTimerRunning, // Show when the timer is running
                  child: Text('Resend otp in : $countdownSeconds seconds'),
                ),
                SizedBox(height: 50),
                Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [Color(0xffC03437), Color(0xFFD62327)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's action here
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => StudentForm()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
