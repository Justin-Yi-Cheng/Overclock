// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drawer.dart';

class PrototypingPage extends StatefulWidget {
  const PrototypingPage({super.key});

  @override
  State<PrototypingPage> createState() => _PrototypingPageState();
}

class _PrototypingPageState extends State<PrototypingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Prototyping",
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
                  height: 680,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 490,
                        height: 490,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Prototype.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        child: Container(
                          width: 450,
                          height: 480,
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
                                  "What is Prototyping?",
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
                                  "Prototyping is the act of planning out the design of the robot before constructing using raw materials. It is usually done on an online 3D Editor and comes with MANY advantages. Some advantages include...",
                                  style: GoogleFonts.lexend(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 4.0, 20.0, 4.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Text(
                                        "1.",
                                        style: GoogleFonts.lexend(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.left,
                                      ),
                                      title: Text(
                                        "Using a 3D Editor saves a lot of TIME otherwise constructing and destroying the robot.",
                                        style: GoogleFonts.lexend(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaleFactor: 0.9,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "2.",
                                        style: GoogleFonts.lexend(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.left,
                                      ),
                                      title: Text(
                                        "Using a 3D Editor also allows for greater percision. This makes it easier for builders to later plan out how to best utilize space on the robot so that everything fits while also ensuring the weight of the robot is well distributed.",
                                        style: GoogleFonts.lexend(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaleFactor: 0.9,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "3.",
                                        style: GoogleFonts.lexend(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.left,
                                      ),
                                      title: Text(
                                        "Using a 3D Editor also helps save MONEY. Most digital copies of robotics parts are found online can be downloaded. Therefore, it can save money knowing exactly what to buy rather than buy in bulk and waste a lot of equipment expeirmenting. This becomes especially true when parts must be cut apart to create a certain design.",
                                        style: GoogleFonts.lexend(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaleFactor: 0.9,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 340,
                  height: 150,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "For THIS robotics team, we use our sponsored program called Solidworks. Throughout the rest of this page, we'll discuss the specific techniques that goes into CREATING a construction and RENDERING in Solidworks.",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      textScaleFactor: 0.9,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("Solidworks.png"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
