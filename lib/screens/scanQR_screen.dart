import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imwell/constants.dart';
import 'package:imwell/screens/profile.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({Key? key}) : super(key: key);

  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Scanner"),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) async {
            if (barcode.rawValue == null) {
              //print('Failed to scan Barcode');
              Fluttertoast.showToast(msg: "Failed to scan.Please try again");
            } else {
              final String code = barcode.rawValue!;
              await vaccinateUser(code);
            }
          }),
    );
  }

  Future<void> vaccinateUser(String vaccineString) async {
    final data = jsonDecode(vaccineString) as Map<String, dynamic>;
    print(data);
    print(DateTime.parse(data["date"]));
    await FirebaseFirestore.instance
        .doc("users/${FirebaseAuth.instance.currentUser!.uid}")
        .update({
      "vaccines": FieldValue.arrayUnion([
        {
          "vaccineId": data["vaccineId"],
          "centreId": data["centreId"],
          "vaccineName": data["vaccineName"],
          "date": Timestamp.fromDate(DateTime.parse(data["date"]))
        }
      ])
    });
    Fluttertoast.showToast(msg: "successfully updated profile!");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
  }
}
