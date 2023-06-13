// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer.dart';
import '../firebase_info.dart';

class AcceptancePage extends StatefulWidget {
  const AcceptancePage({super.key});

  @override
  State<AcceptancePage> createState() => _AcceptancePageState();
}

class _AcceptancePageState extends State<AcceptancePage>
    with SingleTickerProviderStateMixin {
  late Future userData;
  List<String> acceptanceLetterTextList = [
    "Congratuations ${currentUserData["Name"]}! As senior director of KG Computech, I am thrilled to offer you admission into our premier Overclock Robotics team. You stood out in a highly competative application pool and I believe that you will take advantage of all of our Robotics team resources. We know that this robotics team will greatly benefit your talents.",
    "We have sent an email regarding mandatory fees for joining the team. We would like a response regarding fees and entrance no later than May 31st. If a response is not sent before May 31st, it will be assumed that you have no interest for joining the team. No responses or fees past May 31st will be accepted. Upon sending the fee, expect around a week delay before awaiting further instructions regarding schedules and meeting time."
  ];
  List<String> rejectionLetterTextList = [
    "Senior directors and students have carefully reviewed your application to the Overclock Robotics team. After much consideration, I regret to inform you that we are unable to offer you a place onto the team. This year's application pool was especially competative and in light of this, we are unable to offer admission to every worthy applicant.",
    "I recognize that this message may come as dissapointment to you. Nevertheless, I encourage you to make future educational plans with the same enthusiasm and initiative that led you to consider us. We consider the interest you have shown to the Overclock robotics team. Best wishes on your future educaitonal goals.",
  ];

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    userData = getCurrentUserData();
    setRefID();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Acceptance Letter",
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
      body: StreamBuilder(
        stream: userData.asStream(),
        builder: (context, snapshot) {
          if (currentUserData["Acceptance"] == 0) {
            return Center(
              child: Text(
                "Decision Pending...",
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 3.25,
              ),
            );
          } else if (0 < currentUserData["Acceptance"] &&
              currentUserData["Acceptance"] <= 2) {
            return Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 480,
                      height: 1100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "Overclock_Logo.png",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 90,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "KGComputech_Logo.png",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: Text(
                      "Robotics Team Office",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                  Positioned(
                    top: 45,
                    right: 30,
                    child: Text(
                      "37-02 Main St, Flushing, NY 11354",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 30,
                    child: Text(
                      "May 31st, 2023",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 30,
                    child: Text(
                      "Dear ${currentUserData["Name"]},",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 2 ? 140 : 150,
                    left: 30,
                    child: SizedBox(
                      width: 440,
                      height: 800,
                      child: Text(
                        currentUserData["Acceptance"] == 2
                            ? rejectionLetterTextList[0]
                            : acceptanceLetterTextList[0],
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        textScaleFactor: 0.75,
                      ),
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 2 ? 210 : 230,
                    left: 30,
                    child: SizedBox(
                      width: 440,
                      height: 800,
                      child: Text(
                        currentUserData["Acceptance"] == 2
                            ? rejectionLetterTextList[1]
                            : acceptanceLetterTextList[1],
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        textScaleFactor: 0.75,
                      ),
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 2 ? 290 : 320,
                    right: 30,
                    child: Text(
                      "Sincerely,",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 2 ? 305 : 335,
                    right: 30,
                    child: Text(
                      "KG Computech",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 2 ? 320 : 350,
                    right: 30,
                    child: Text(
                      "Senior Director of Overclock",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  SlideTransition(
                    key: const Key("IntroSlideTransition"),
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (currentUserData["Acceptance"] == 1) {
                          setAcceptance(3);
                        }

                        if (currentUserData["Acceptance"] == 2) {
                          setAcceptance(4);
                        }

                        animationController.reverse();
                      },
                      child: Container(
                        width: appWidth,
                        height: appHeight,
                        color: const Color.fromRGBO(255, 49, 49, 1),
                        child: Stack(
                          children: [
                            Center(
                              child: Transform(
                                transform:
                                    Matrix4.translationValues(0, -150.0, 0),
                                child: Text(
                                  "THIS",
                                  style: GoogleFonts.lexend(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textScaleFactor: 11,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Center(
                              child: Transform(
                                transform: Matrix4.translationValues(0, 50, 0),
                                child: SizedBox(
                                  width: 400,
                                  height: 200,
                                  child: Text(
                                    "IS THE MOMENT YOU HAVE BEEN WAITING FOR",
                                    style: GoogleFonts.lexend(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
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
          } else if (currentUserData["Acceptance"] >= 3) {
            return Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 480,
                      height: 1100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "Overclock_Logo.png",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 90,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "KGComputech_Logo.png",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: Text(
                      "Robotics Team Office",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                  Positioned(
                    top: 45,
                    right: 30,
                    child: Text(
                      "37-02 Main St, Flushing, NY 11354",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 30,
                    child: Text(
                      "May 31st, 2023",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 30,
                    child: Text(
                      "Dear ${currentUserData["Name"]},",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 4 ? 140 : 150,
                    left: 30,
                    child: SizedBox(
                      width: 440,
                      height: 800,
                      child: Text(
                        currentUserData["Acceptance"] == 4
                            ? rejectionLetterTextList[0]
                            : acceptanceLetterTextList[0],
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        textScaleFactor: 0.75,
                      ),
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 4 ? 210 : 230,
                    left: 30,
                    child: SizedBox(
                      width: 440,
                      height: 800,
                      child: Text(
                        currentUserData["Acceptance"] == 4
                            ? rejectionLetterTextList[1]
                            : acceptanceLetterTextList[1],
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        textScaleFactor: 0.75,
                      ),
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 4 ? 290 : 320,
                    right: 30,
                    child: Text(
                      "Sincerely,",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 4 ? 305 : 335,
                    right: 30,
                    child: Text(
                      "KG Computech",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                  Positioned(
                    top: currentUserData["Acceptance"] == 4 ? 320 : 350,
                    right: 30,
                    child: Text(
                      "Senior Director of Overclock",
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      textScaleFactor: 0.75,
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
