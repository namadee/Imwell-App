import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imwell/constants.dart';

Future<Map<String, dynamic>> fetchStats() async {
  final response = await http.get(
      Uri.parse("https://www.hpb.health.gov.lk/api/get-current-statistical"));

  // Appropriate action depending upon the
  // server response
  if (response.statusCode == 200) {
    return json.decode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load album');
  }
}

class Stats {
  bool? success;
  String? message;
  Data? data;

  Stats({this.success, this.message, this.data});

  Stats.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? localNewCases;
  int? localTotalCases;
  int? localDeaths;
  int? localNewDeaths;
  int? localRecovered;
  int? localActiveCases;
  int? globalNewCases;

  Data({
    this.localNewCases,
    this.localTotalCases,
    this.localDeaths,
    this.localNewDeaths,
    this.localRecovered,
    this.localActiveCases,
    this.globalNewCases,
  });

  Data.fromJson(Map<String, dynamic> json) {
    localNewCases = json['local_new_cases'];
    localTotalCases = json['local_total_cases'];
    localDeaths = json['local_deaths'];
    localNewDeaths = json['local_new_deaths'];
    localRecovered = json['local_recovered'];
    localActiveCases = json['local_active_cases'];
    globalNewCases = json['global_new_cases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['local_new_cases'] = this.localNewCases;
    data['local_total_cases'] = this.localTotalCases;

    data['local_deaths'] = this.localDeaths;
    data['local_new_deaths'] = this.localNewDeaths;
    data['local_recovered'] = this.localRecovered;
    data['local_active_cases'] = this.localActiveCases;
    data['global_new_cases'] = this.globalNewCases;

    return data;
  }
}

// class Album {
//   bool success;
//   String message;
//   int localNewCases;

//   Album(
//       {required this.success,
//       required this.message,
//       required this.localNewCases});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//         success: json["success"],
//         message: json["message"],
//         localNewCases: json["local_new_cases"]);
//   }
// }

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late Future<Map<String, dynamic>> stats;

  @override
  void initState() {
    super.initState();
    stats = fetchStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 8.0, right: 8.0),
              child: Container(
                  height: 300.0,
                  width: double.infinity,
                  child: const Text(
                    "",
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryColor)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Container(
                  height: 125.0,
                  width: 180.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Total vaccinated first dose",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "80%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(166, 125, 221, 0.5),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 210, top: 60),
              child: Container(
                  height: 125.0,
                  width: 180.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Total Vaccinated second Dose",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "50%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(166, 125, 221, 0.5),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 200),
              child: Container(
                  height: 125.0,
                  width: 370.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Vaccinated population",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "80%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(166, 125, 221, 0.5),
                  )),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: Container(
              height: 250.0,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/post1.jpg",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Over 80% of the world population vaccinated",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryAccentColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: Container(
              height: 300.0,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/post.jpg",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Schools Are to beggin after vaccination of all children",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryAccentColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));

    // body: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     //Text("Data: ${}"),
    //     Center(
    //       child: FutureBuilder<Map<String, dynamic>>(
    //         future: stats,
    //         builder: (context, snapshot) {
    //           if (snapshot.hasData) {
    //             return Text(snapshot.data!['message']);
    //           } else if (snapshot.hasError) {
    //             return Text("${snapshot.error}");
    //           }
    //           return const CircularProgressIndicator();
    //         },
    //       ),
    //     ),
    //   ],
    // ),
  }
}
