import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imwell/screens/scanQR_screen.dart';
import 'package:intl/intl.dart';
import 'package:imwell/constants.dart';
import 'package:imwell/models/user_model.dart';
import 'package:imwell/screens/login_screen.dart';

import '../navigation_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  // List<dynamic> vaccinesWithDates = [];

  // void convertToVaccinesWithDates(List<dynamic> vaccinesWithTImestamps) {
  //   for (var element in vaccinesWithTImestamps) {
  //     final data = {
  //       "vaccineId": element['vaccineId'],
  //       "centreId": element['centreId'],
  //       "date": (element['date'] as Timestamp).toDate(),
  //       "vaccineName": element['vaccineName']
  //     };
  //     vaccinesWithDates.add(data);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: user!.uid)
        .get()
        .then((result) {
      //print(result.docs[0].data());

      final data = result.docs[0].data();
      // List<dynamic> vaccinesWithDates = [];
      // for (var element in data['vaccines']) {
      //   final data = {
      //     "vaccineId": element['vaccineId'],
      //     "centreId": element['centreId'],
      //     //convert date to date
      //     "date": (element['date'] as Timestamp).toDate(),
      //     "vaccineName": element['vaccineName']
      //   };
      //   vaccinesWithDates.add(data);
      // }
      setState(() {
        loggedInUser = UserModel.fromMap({
          "uid": data["uid"],
          "name": data['name'],
          "email": data['email'],
          "district": data['district'],
          "bloodGroup": data['bloodGroup'],
          "vaccines": data['vaccines']
        });
      });
      // final VaccineDateTime =
      //     (loggedInUser.vaccines?.elementAt(0)['date'] as Timestamp).toDate();
      // print("this is vdate \n\n\n");
      // print(VaccineDateTime);
      // print("this is vdate \n\n\n");

      //print(loggedInUser);
    }, onError: (e) => print("error code :${e}"));

    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(user!.uid)
    //     .get()
    //     .then((value) {
    //   print(value.data);
    //   setState(() {
    //     this.loggedInUser = UserModel.fromMap(value.data());
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    String formatted;
    //print("${loggedInUser.email}");
    if (loggedInUser.vaccines!.length != 0) {
      final VaccineDateTime =
          (loggedInUser.vaccines?.elementAt(0)['date'] as Timestamp).toDate();
      // final VaccineDateTime =
      //     (loggedInUser.vaccines?.elementAt(0)['date'] as Timestamp).toDate();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      formatted = formatter.format(VaccineDateTime);
      // print("this is vdate \n\n\n");
      // print(VaccineDateTime);
      // print(formatted);
      // print("this is vdate \n\n\n");
    } else {
      formatted = 'Not vaccinated';
    }

    return Scaffold(
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(
                      "assets/images/logo1.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "User Name : ${loggedInUser.name}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Email ${loggedInUser.email}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "District ${loggedInUser.district}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Blood Group ${loggedInUser.bloodGroup}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                  child: loggedInUser.vaccines!.length != 0
                      ? Container(
                          height: 200.0,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Stack(children: [
                              Text(
                                "Vaccine: ${loggedInUser.vaccines?.elementAt(0)['vaccineName']}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  "${formatted}",

                                  //"Date vaccinated: ${loggedInUser.vaccines!.length != 0 ? formatted : 'notvaccinated'  }",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kPrimaryColor))
                      : Text("You are not vaccinated"),
                ),
                SizedBox(height: 25),
                Center(
                    child: Text(
                  'Scan the QR code to update your Data',
                  style: TextStyle(fontSize: 17),
                )),
                SizedBox(height: 25),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        child: const Text(
                          "Scan Now",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanQRScreen()),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
