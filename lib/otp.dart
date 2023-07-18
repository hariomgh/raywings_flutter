import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Color borderColor = Color(0xFF800000);
  bool isTimerRunning = false; // Variable to track the timer state
  int countdownSeconds = 30; // Countdown time in seconds
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the screen is first loaded
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Verify', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                Text('we have sent a 4 digit OTP to', style: TextStyle(fontSize: 15)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+91 *** *** ' + '0000',
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
                      onPressed: () {},
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
                  focusedBorderColor: Color(0xff800000), // Set the focused border color to red
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
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
                  visible: !isTimerRunning, // Show when the timer is not running
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive your otp",
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
                          // Start the timer when "send again" is pressed
                          startTimer();
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
                  child: Text('resend otp in : $countdownSeconds seconds'),
                ),
                SizedBox(height: 50),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [Colors.black, Color(0xFF800000)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's action here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    child: Text(
                      'SUBMIT',
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

  void startTimer() {
    // Start the timer countdown
    setState(() {
      isTimerRunning = true;
    });

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        countdownSeconds--;
        if (countdownSeconds <= 0) {
          // Timer finished, reset the variables
          timer.cancel();
          isTimerRunning = false;
          countdownSeconds = 30;
        }
      });
    });
  }
}

