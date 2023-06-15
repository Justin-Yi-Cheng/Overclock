import 'package:flutter/material.dart';
import 'package:overclock_app/Webpages/ProfilePage.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:expandable/expandable.dart';
import 'package:overclock_app/login.dart';

import '../firebase_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Webpages/AcceptancePage.dart';
import 'Webpages/CodeOfConductPage.dart';
import 'Webpages/StepsToCreatingRobot/BuildingPage.dart';
import 'Webpages/StepsToCreatingRobot/CodingPage.dart';
import 'Webpages/StepsToCreatingRobot/DocumentingPage.dart';
import 'Webpages/StepsToCreatingRobot/PrototypingPage.dart';

class OverclockDrawer extends StatefulWidget {
  const OverclockDrawer({super.key});

  @override
  State<OverclockDrawer> createState() => _OverclockDrawerState();
}

class _OverclockDrawerState extends State<OverclockDrawer> {
  bool isFirstTimeVisible =
      currentUserData["Acceptance"] == 0 || currentUserData["Acceptance"] == 3;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Overclock",
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 2,
              ),
            ),
            Container(
              color: Colors.white,
              width: appWidth * 0.05,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: SizedBox(
                width: 210,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    DrawerOption(
                      text: "Acceptance Letter",
                      navPush: const AcceptancePage(),
                    ),
                    DrawerOption(
                      text: "Dashboard",
                      navPush: const ProfilePage(),
                      isVisible: isFirstTimeVisible,
                    ),
                    Visibility(
                      visible: isFirstTimeVisible,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          iconColor: Colors.white,
                        ),
                        header: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Robot Creation",
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: Align(
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              DrawerOption(
                                text: "Prototyping",
                                navPush: const PrototypingPage(),
                                fontWeight: FontWeight.w300,
                                fontScaleFactor: 0.9,
                              ),
                              DrawerOption(
                                text: "Building",
                                navPush: const BuildingPage(),
                                fontWeight: FontWeight.w300,
                                fontScaleFactor: 0.9,
                              ),
                              DrawerOption(
                                text: "Coding / Testing",
                                navPush: const CodingPage(),
                                fontWeight: FontWeight.w300,
                                fontScaleFactor: 0.9,
                              ),
                              DrawerOption(
                                text: "Documenting",
                                navPush: const DocumentingPage(),
                                fontWeight: FontWeight.w300,
                                fontScaleFactor: 0.9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    DrawerOption(
                      text: "Code of Conduct",
                      navPush: const CodeOfConductPage(),
                      isVisible: isFirstTimeVisible,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Logout",
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DrawerOption extends StatefulWidget {
  DrawerOption({
    super.key,
    required this.text,
    required this.navPush,
    this.isVisible,
    this.fontScaleFactor,
    this.fontWeight,
  });

  String text;
  dynamic navPush;
  bool? isVisible = true;
  double? fontScaleFactor;
  FontWeight? fontWeight;

  @override
  State<DrawerOption> createState() => _DrawerOptionState();
}

class _DrawerOptionState extends State<DrawerOption> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.navPush,
        ),
      ),
      child: Visibility(
        visible: widget.isVisible == null ? true : widget.isVisible!,
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.text,
              style: GoogleFonts.lexend(
                color: Colors.white,
                fontWeight: widget.fontWeight == null
                    ? FontWeight.w400
                    : widget.fontWeight!,
              ),
              textScaleFactor: widget.fontScaleFactor == null
                  ? 1.2
                  : widget.fontScaleFactor!,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
