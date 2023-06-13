// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer.dart';

class CodeOfConductPage extends StatefulWidget {
  const CodeOfConductPage({super.key});

  @override
  State<CodeOfConductPage> createState() => _CodeOfConductPageState();
}

class _CodeOfConductPageState extends State<CodeOfConductPage> {
  List<String> rulesTitleList = [
    "Keep Working",
    "Noise Level",
    "Appropiateness",
    "No Fighting",
    "Food Rules",
    "No Distractions",
    "Banned Relationships",
    "Common Sense",
  ];

  List<String> rulesList = [
    "Remain on task at all times. Everyone on the team are expected to contribute their own share of work. If anyone on the team has any complaints about a particular individual, they may report it to the coach.",
    "Don't be loud. While music within your respective rooms are allowed, any noise heard outside your room will result in the immediate ban of music-playing for that specific team and everyone required to rewrite the rules 10 times on paper.",
    "Do not voice or show ANY racial slurs, offensive images, or NSFW content.",
    "Do NOT start fights within the office. If any fights are reported, it may result in the immediate expulsion from the team.",
    "You may ONLY consume food in room 301. After eating your food, your area must be cleaned thoroughly. Also, please dispose the food properly and do NOT throw liquids directly into the trash bin.",
    "Not accessing social media or playing video games within the office. Any such activities will result in immediate confiscation of such digital devices.",
    "No relationships WITHIN the Overclock team are allowed. Any shown relationships must be shared to the coach immediately.",
    "Use your head. Do not be the reason why we have to make a new rule.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 240, 1),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: const Color.fromRGBO(199, 0, 57, 1),
        centerTitle: true,
        title: Text(
          "Code of Conduct",
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
        child: Center(
          child: SizedBox(
            width: 590,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(5.0),
              itemCount: rulesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          rulesTitleList[index],
                          style: GoogleFonts.lexend(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1.25,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          rulesList[index],
                          style: GoogleFonts.lexend(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          textScaleFactor: 0.75,
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
