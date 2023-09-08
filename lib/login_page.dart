import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'otp.dart';
import 'package:http/http.dart' as http;


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
      String dialCode = countryCode?.dialCode ?? '+91';

      // Pass phone number and country code to the OtpScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            phoneNumber: phoneNumber,
            countryCode: dialCode,
          ),
        ),
      );
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200,),
                    Text(
                      'Enter your Mobile number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 10 ),
                          Container(
                            width: 265,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 0.50,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        border: Border(right: BorderSide(color: Colors.black,width: 0.5, )),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10,),
                                          Text(
                                            countryCode?.dialCode ?? '+91'+' ',
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down, size: 22),
                                          SizedBox(width: 10,),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Expanded(
                                  child: TextFormField(
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(fontSize: 25),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your mobile number here';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '0000000000',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                          SizedBox(height: 150),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff800000), Color(0xFFBC1616)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                                _sendOTP();
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
        ],
      ),
    );
  }
}