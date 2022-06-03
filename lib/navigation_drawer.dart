import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imwell/constants.dart';
import 'package:imwell/screens/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Drawer(
      child: Material(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/logo1.png",
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "ImWell",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 25),
              Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              SizedBox(height: 100),
              DrawerItem(
                  name: 'Contact Us',
                  onPressed: (() {
                    openwhatsapp();
                  })),
              SizedBox(
                height: 15,
              ),
              DrawerItem(
                  name: 'Logout',
                  onPressed: (() {
                    logout(context);
                  })),
            ],
          ),
        ),
      ),
    );
  }
}

openwhatsapp() async {
  var whatsapp = "+94722739297";
  var whatsappURl_android = "whatsapp://send?phone=" + whatsapp + "&text=hello";

  // android , web
  if (await canLaunch(whatsappURl_android)) {
    await launch(whatsappURl_android);
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()));
}
