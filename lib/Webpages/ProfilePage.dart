// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:expandable/expandable.dart';

import '../firebase_info.dart';
import '../drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future userDataInstance;
  late Future allUserDataInstance;
  late String currentRole = currentUserData["Position"];
  late String currentRoleDescription;

  List<String> allRoles = [
    "Captain",
    "Vice-Captain",
    "Shop Manager",
    "Secretary",
    "Coder",
    "Builder",
    "Driver",
  ];

  final List<String> allRoleDescriptions = [
    "Your role as captain is to help manage the ENTIRE team. If something wrong happens on the team, the FIRST person to blame is ALWAYS you. You are given uppermost priority on how to dish out workloads and punishments. Make sure that everyone on the team remains productive and behaves well, especially within tournament settings.",
    "Your role as vice-captain is to help out the captain on their duties. Offer the captains advice and take charge of team activities when the Captain is absent. Ensure everyone on the team remains productive and behaves well. You are also expected to share a closer connection to the individual members compared to the Captain.",
    "Your role as shop-manager is to keep track of all expenses spent on the current robot and all previous prototypes. You are given executive decision (behind captain) on how to manage the team's expenses and whether the team is allowed to buy certain robot parts. You are expected to present an excel spreadsheet of all robot expenses to the coach several days before the tournament.",
    "Your job as secretary is to keep the team organized. Keep track of all times in which students are available to come to office and ensure students come AT LEAST three times a week unless an excuse is presented. Keep track of who is given what work to ensure maximum efficiency and to prevent members from overlapping work. Your are also expected to update the team's notebook with current information.",
    "Your job as coder is to create autonomous codes for BOTH the skills challenges and autonomous section of robotics matches. You are expected to repeatedly test-run your code before the tournament and during the tournament. Your job will mostly come into play AFTER the robot has been built. While the robot has not been built yet, you are expected to help out on other aspects of the robot.",
    "Your job as builder is to plan out and create the robot. Start with a CAD model to plan out the design, and then use various tools around the office to build the robot. Your job is to ensure the robot is practical to use and feels smooth to drive. After you are finished building the robot, builders are expected to help the coders repeatedly set up the robotics field.",
    "Your job as driver is to prepare for the driver skill challenges and the conduct real-time practice matches with other team members. You are expected to perform well during tournaments and failure to meet specific score requirements may result in the immediate termination of your position. While the robot is still being built, you are expected to work on the notebook or help other team members build.",
  ];

  @override
  void initState() {
    super.initState();
    setRefID();
    userDataInstance = getCurrentUserData();
    allUserDataInstance = getAllUserData();
    currentRoleDescription = allRoleDescriptions[allRoles.indexOf(currentRole)];
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isOnline =
        ValueNotifier(currentUserData["Status"] == "Online");

    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Dashboard",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: userDataInstance,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 145,
                      child: Card(
                        elevation: 8.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Transform(
                                    transform:
                                        Matrix4.translationValues(-60, 5, 0),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              105, 105, 105, 0.8),
                                          width: 1.0,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            currentUserData["Profile-Picture"],
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Transform(
                                    transform:
                                        Matrix4.translationValues(30, 0, 0),
                                    child: SizedBox(
                                      width: 100,
                                      height: 50,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "${currentUserData["Name"]}",
                                          style: GoogleFonts.lexend(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Transform(
                                    transform:
                                        Matrix4.translationValues(0, 30, 0),
                                    child: SizedBox(
                                      width: 35,
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "${currentUserData["Position"]}",
                                          style: GoogleFonts.lexend(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: isOnline,
                                  builder: ((context, value, child) {
                                    return Stack(
                                      children: [
                                        Positioned(
                                          top: 50,
                                          left: 75,
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: isOnline.value
                                                  ? Colors.green
                                                  : Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 49,
                                          left: 90,
                                          child: Text(
                                            isOnline.value
                                                ? "Online"
                                                : "Offline",
                                            style: GoogleFonts.lexend(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textScaleFactor: 0.65,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () async {
                                            await setStatus();
                                            isOnline.value =
                                                currentUserData["Status"] ==
                                                    "Online";
                                          },
                                          child: SizedBox(
                                            height: 120,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                width: 150,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: isOnline.value
                                                      ? const Color.fromRGBO(
                                                          211, 211, 211, 1)
                                                      : const Color.fromRGBO(
                                                          255, 49, 49, 1),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Center(
                                                    child: Text(
                                                      isOnline.value
                                                          ? "Attendance Submitted"
                                                          : "Submit Attendance",
                                                      style: GoogleFonts.lexend(
                                                        color: isOnline.value
                                                            ? const Color
                                                                    .fromRGBO(
                                                                173,
                                                                173,
                                                                173,
                                                                1)
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 0.85,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 290,
                      height: 145,
                      child: Card(
                        elevation: 8.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 2),
                              child: Text(
                                currentRole,
                                style: GoogleFonts.lexend(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
                              child: Text(
                                currentRoleDescription,
                                style: GoogleFonts.lexend(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 0.6,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            FutureBuilder(
              future: allUserDataInstance,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                }

                return SizedBox(
                  width: 490,
                  child: Card(
                    elevation: 8.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                          child: Text(
                            "Member List",
                            style: GoogleFonts.lexend(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.75,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
                          child: Container(
                            color: Colors.grey,
                            width: 80,
                            height: 2,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: allUserData.length,
                          itemBuilder: (context, index) {
                            return ExpandablePanel(
                              theme: const ExpandableThemeData(
                                iconColor: Colors.black,
                                iconSize: 20,
                              ),
                              header: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              105, 105, 105, 0.8),
                                        ),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(allUserData[index]
                                              ["Profile-Picture"]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: SizedBox(
                                        width: 340,
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              allUserData[index]["Name"],
                                              style: GoogleFonts.lexend(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textScaleFactor: 1.25,
                                              textAlign: TextAlign.left,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 2, 0, 4),
                                              child: Text(
                                                allUserData[index]["Position"],
                                                style: GoogleFonts.lexend(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textScaleFactor: 1,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 2, 10, 0),
                                                  child: Container(
                                                    width: 15,
                                                    height: 15,
                                                    decoration: BoxDecoration(
                                                      color: isOnline.value
                                                          ? Colors.green
                                                          : Colors.red,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  isOnline.value
                                                      ? "Online"
                                                      : "Offline",
                                                  style: GoogleFonts.lexend(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              collapsed: const SizedBox.shrink(),
                              expanded: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "${allUserData[index]["Short-Description"]}",
                                  style: GoogleFonts.lexend(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textScaleFactor: 0.85,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
