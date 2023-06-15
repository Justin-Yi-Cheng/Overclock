import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore fire = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser;

List<Map<String, dynamic>> allUserData = [];
Map<String, dynamic> currentUserData = {};
late String refID;

Future getAllUserData() async {
  await fire.collection('Users').get().then(
        (snapshot) => snapshot.docs.forEach(
          (document) {
            allUserData.add(document.data());
          },
        ),
      );

  for (int i = 0; i < allUserData.length; i++) {
    if (allUserData[i]["Name"] == currentUserData["Name"]) {
      allUserData.remove(allUserData[i]);
    }
  }
}

Future getCurrentUserData() async {
  await fire
      .collection('Users')
      .where("Email", isEqualTo: user!.email)
      .get()
      .then((snapshot) => currentUserData = snapshot.docs.first.data());
}

Future setRefID() async {
  await fire
      .collection('Users')
      .where("Email", isEqualTo: user!.email)
      .get()
      .then(
        (snapshot) => refID = snapshot.docs.first.id,
      );
}

Future setAcceptance(int index) async {
  await fire.collection("Users").doc(refID).update({
    "Acceptance": index,
  });

  currentUserData.clear();
  await getCurrentUserData();
  allUserData.clear();
  await getAllUserData();
}

Future setStatus() async {
  await fire.collection("Users").doc(refID).update({
    "Status": "Online",
  });

  currentUserData.clear();
  await getCurrentUserData();
  allUserData.clear();
  await getAllUserData();
}
