// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drawer.dart';

class CodingPage extends StatefulWidget {
  const CodingPage({super.key});

  @override
  State<CodingPage> createState() => _CodingPageState();
}

class _CodingPageState extends State<CodingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Coding / Testing",
          style: GoogleFonts.lexend(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.25,
        ),
      ),
      drawer: const Drawer(
        elevation: 6.0,
        backgroundColor: Color.fromRGBO(255, 49, 49, 1),
        width: 250,
        child: OverclockDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 490,
                  height: 540,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 490,
                        height: 490,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Coding.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340,
                        child: Container(
                          width: 450,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "The Language of VEX Coding",
                                  style: GoogleFonts.lexend(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 160,
                                height: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 8.0, 20.0, 0.0),
                                child: Text(
                                  "OUR robotics team specific coding language relies on learning C++. However, this does NOT mean we must know C++ to know how to code the robot. This is because VEX (our competition sponsors) uses their own specific type of coding language to operate their VEX devices. This means that much of the coding on the robotics team must be learned from scratch other than a few basics.",
                                  style: GoogleFonts.lexend(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 490,
              height: 350,
              child: Stack(
                children: [
                  Container(
                    width: 320,
                    height: 50,
                    color: const Color.fromRGBO(255, 49, 49, 1),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Testing, Testing, Testing...",
                          style: GoogleFonts.lexend(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Container(
                      width: 490,
                      height: 260,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 240,
                        height: 240,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Testing.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 260,
                    child: Text(
                      "The Playingfield",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.25,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 260,
                    child: SizedBox(
                      width: 220,
                      height: 240,
                      child: Text(
                        "Creating good code to compete in BOTH skill challenges and autonomous matches often involves at LEAST two months of testing. It is not something that can be completed easily simply through copying code or being a \"good coder.\" Codes and their results can often differ depending on damages to the playing field and differing weights of different robots. As a result, that is also why it is EXTREMLEY important to test your code prior to tournaments. Simply because your code works at the practice fields in the office does not necessarily mean they will work just as well on the tournament practice fields.",
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textScaleFactor: 0.75,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
