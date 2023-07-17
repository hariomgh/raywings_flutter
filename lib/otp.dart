import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Color borderColor = Color(0xFF800000);

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
                Text('Verify',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )),

                SizedBox(height: 40,),

                Text('we have sent a 4 digit OTP to',
                    style: TextStyle(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                    )),

                SizedBox(height: 10,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('+91 *** *** ' + '0000',
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        )),

                    SizedBox(width: 10,),



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
                      
                      child: Text('Edit Number',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      ),
                    ),
                  ]
                ),

                SizedBox(height: 20,),

                OtpTextField(
                  numberOfFields: 5,
                  borderColor: borderColor,
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

                SizedBox(height: 20,),

                Text('please wait while we verify your OTP'),



                TextButton(
                  onPressed: () {},
                  child: Container(
                    color: Color(0xff800000),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text(
                      'S U B M I T',
                      style: TextStyle(color: Colors.white, fontSize:20 ),
                    ),
                  ),
                ),

                OutlinedButton(
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      color: Color(0xff800000),
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpTextField extends StatefulWidget {
  final int numberOfFields;
  final Color borderColor;
  final bool showFieldAsBox;
  final ValueChanged<String>? onCodeChanged;
  final ValueChanged<String>? onSubmit;

  const OtpTextField({
    Key? key,
    required this.numberOfFields,
    required this.borderColor,
    required this.showFieldAsBox,
    this.onCodeChanged,
    this.onSubmit,
  }) : super(key: key);

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  List<TextEditingController> textControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numberOfFields; i++) {
      textControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.numberOfFields,
            (index) => Container(
          width: 40,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            controller: textControllers[index],
            onChanged: (value) {
              if (widget.onCodeChanged != null) {
                String code = '';
                for (var i = 0; i < widget.numberOfFields; i++) {
                  if (i == index) {
                    code += value;
                  } else {
                    code += textControllers[i].text;
                  }
                }
                widget.onCodeChanged!(code);
              }
            },
            onSubmitted: (value) {
              if (widget.onSubmit != null) {
                String code = '';
                for (var controller in textControllers) {
                  code += controller.text;
                }
                widget.onSubmit!(code);
              }
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: widget.borderColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: widget.borderColor, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
