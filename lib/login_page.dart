import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'otp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  final _phoneNumberController = TextEditingController();

  void _sendOTP() {
    if (_formKey.currentState!.validate()) {
      String phoneNumber = _phoneNumberController.text;
      // TODO: Send OTP functionality
      print('Sending OTP to $phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo-icon.png"),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Enter your Phone number',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 50),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Please enter your mobile number',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final code = await countryPicker.showPicker(context: context);

                                      setState(() {
                                        countryCode = code;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.black, )),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.arrow_drop_down),
                                            SizedBox(width: 20,),
                                            Text(
                                              countryCode?.dialCode ?? '+91'+' ',
                                              style: TextStyle(
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(fontSize: 25), // Set the desired font size
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your mobile number';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '000 000 0000',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Please enter your mobile number',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black, Color(0xFF800000)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 200,
                                  child: Text(
                                    'Send OTP',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
