// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drawer.dart';

class BuildingPage extends StatefulWidget {
  const BuildingPage({super.key});

  @override
  State<BuildingPage> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Building",
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
                  height: 620,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 490,
                        height: 490,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Building.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340,
                        child: Container(
                          width: 450,
                          height: 280,
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
                                  "The Foundations of Building",
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
                                  "Building is THE MOST time consuming aspect of creating a robot. It involves sawing, building, and more often than not destroying parts of the robot over and over again until the perfect robot is created. Even with prototyping, building can often be a trail and error process. However, it the MOST FUNDAMENTAL aspect of robotics and ALL members are expected to know how to build the robot if the extra labor is required. Learning how to BUILD often involves knowing the different tools and techniques that are needed to build parts in a time-efficient manner.",
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
              height: 410,
              child: Stack(
                children: [
                  Container(
                    width: 240,
                    height: 50,
                    color: const Color.fromRGBO(255, 49, 49, 1),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Tools of the Trade",
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
                    top: 65,
                    left: 10,
                    child: Container(
                      width: 180,
                      height: 130,
                      color: const Color.fromRGBO(255, 191, 0, 1),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Container(
                      width: 180,
                      height: 130,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Dremel.jpeg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 0,
                    child: Container(
                      width: 305,
                      height: 145,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 12.0, 0, 6.0),
                            child: Text(
                              "Dremel",
                              style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.25,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 6.0, 0, 6.0),
                            child: Container(
                              width: 160,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              "Dremels are mini-handsaws that are used to make small incisions into robotic parts. When handling a dremel, you MUST wear the metal glove located near the dremel. Using the dremel may sometimes be unstable, so no one is allowed to distract people who are using the dremel.",
                              style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              textScaleFactor: 0.75,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 215,
                    right: 5,
                    child: Container(
                      width: 180,
                      height: 180,
                      color: const Color.fromRGBO(253, 218, 13, 1),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    right: 0,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Saw.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 205,
                    left: 0,
                    child: Container(
                      width: 305,
                      height: 185,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 12.0, 0, 0.0),
                            child: Text(
                              "Saw",
                              style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.25,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 6.0, 0, 6.0),
                            child: Container(
                              width: 160,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              "Saw are esentially larger dremels used to cut apart thicker, tougher materials. When handling the saw, goggles and a metal glove must be worn. When placing the material down onto the platform, you must grip onto the material VERY tightly. When using the saw, you must yell \"SAW\" before operating the mechanism so that everyone in the room has the opportunity to close their ears.",
                              style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              textScaleFactor: 0.75,
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
          ],
        ),
      ),
    );
  }
}
