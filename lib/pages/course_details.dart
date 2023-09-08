import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import '../utils.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class CourseInfo {
  final String title;
  final String subTitle;

  CourseInfo({required this.title, required this.subTitle});
}

class _CourseDetailsState extends State<CourseDetails> {
  final List<CourseInfo> courseInfoList = [
    CourseInfo(title: "Introduction", subTitle: "12 Videos"),
    CourseInfo(title: "Swimming Basic Skill", subTitle: "8 Videos"),
    CourseInfo(title: "Intermediate", subTitle: "10 Videos"),
    CourseInfo(title: "Expert & Life Hack", subTitle: "6 Videos"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              child: Image.network(
                "https://img.freepik.com/premium-vector/swimming-classes-square-flyer-template_23-2148786079.jpg?w=2000",
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      color: Colors.transparent,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color: Colors.black.withOpacity(0.10000000149011612),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 14.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Swimming Course",
                                      style: GoogleFonts.montserrat(
                                        color: black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "John Doe",
                                          style: GoogleFonts.montserrat(
                                            color: black,
                                            fontSize: 16,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(
                                          "+Follow",
                                          style: GoogleFonts.montserrat(
                                            color: scaffoldbg,
                                            fontSize: 16,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                LikeButton(
                                  size: 50,
                                  circleColor: CircleColor(
                                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked ? Colors.red : Colors.grey,
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: courseInfoList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 16.0,
                                    ),
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.2,
                                        color: Colors.grey[400]!,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          16.0,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              courseInfoList[index].title,
                                              style: GoogleFonts.montserrat(
                                                color: black,
                                                fontSize: 18,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              courseInfoList[index].subTitle,
                                              style: GoogleFonts.montserrat(
                                                color: grey,
                                                fontSize: 15,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          CupertinoIcons.chevron_forward,
                                          color: black,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "\$ 100 ",
                                  style: GoogleFonts.montserrat(
                                    color: black,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 60,
                                  width: 160,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blue,
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(64.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Buy Course",
                                      style: GoogleFonts.montserrat(
                                        color: white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
