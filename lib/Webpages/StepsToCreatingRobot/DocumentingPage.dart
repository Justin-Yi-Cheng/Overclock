// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drawer.dart';

class DocumentingPage extends StatefulWidget {
  const DocumentingPage({super.key});

  @override
  State<DocumentingPage> createState() => _DocumentingPageState();
}

class _DocumentingPageState extends State<DocumentingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Documenting",
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
                            image: AssetImage("VEX_Notebook.jpeg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340,
                        child: Container(
                          width: 450,
                          height: 340,
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
                                  "Creating The Notebook",
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
                                  "Creating the robotics team notebook is the most important, yet ironically often the most overlooked aspects of competing in robotics. It is supposed to neatly state all steps and thought processes that came into building the robot, along with any progress or setbacks along the way. Creating the notebook is REALLY important because it potentially allows your team to gain additional points or awards in the tournaments that are often based off the notebook. Awards that uses the notebook include the highest ranking award - the Excellence Award, the innovative award, and more. Keeping constant tabs and updates on your team's notebook on a daily or sub-weekly basis is vital to ensuring that all of the paperwork is not left until the last minute. ",
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
              height: 720,
              child: Stack(
                children: [
                  Container(
                    width: 290,
                    height: 50,
                    color: const Color.fromRGBO(255, 49, 49, 1),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Notebook Requirements",
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
                      width: 120,
                      height: 560,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Notebook.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 60,
                    child: Container(
                      width: 390,
                      height: 100,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 70,
                    child: SizedBox(
                      width: 370,
                      height: 60,
                      child: Text(
                        " - Must contain ALL named sections\n - Each section must also show their respective page numbers.\n - Notebook notes must ALL be handwritten.",
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textScaleFactor: 0.85,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 50,
                    child: Container(
                      width: 290,
                      height: 50,
                      color: const Color.fromRGBO(199, 0, 57, 1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "1. Table of Contents",
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            textScaleFactor: 1.25,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 260,
                    left: 80,
                    child: Container(
                      width: 390,
                      height: 100,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 290,
                    left: 90,
                    child: SizedBox(
                      width: 370,
                      height: 60,
                      child: Text(
                        "Must rewrite all of the game rules printed on the VEX website and highlight the rules most important to deciding the competition.",
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textScaleFactor: 0.85,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    left: 70,
                    child: Container(
                      width: 290,
                      height: 50,
                      color: const Color.fromRGBO(199, 0, 57, 1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "2. Game Rules",
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            textScaleFactor: 1.25,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 410,
                    left: 40,
                    child: Container(
                      width: 390,
                      height: 100,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 440,
                    left: 50,
                    child: SizedBox(
                      width: 370,
                      height: 60,
                      child: Text(
                        "Must predict a potential robot and strategy that may be most efficient in completing the specific robotics challenge that year. Must explain why this specific strategy is the most efficient.",
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textScaleFactor: 0.85,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    left: 50,
                    child: Container(
                      width: 290,
                      height: 50,
                      color: const Color.fromRGBO(199, 0, 57, 1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "3. Strategy Guide",
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            textScaleFactor: 1.25,
                            textAlign: TextAlign.left,
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
    );
  }
}
