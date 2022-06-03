// import 'package:imwell/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class StatsScreen extends StatefulWidget {
//   const StatsScreen({Key? key}) : super(key: key);

//   @override
//   _StatsScreenState createState() => _StatsScreenState();
// }

// class _StatsScreenState extends State<StatsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 25,
//           ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 40.0, left: 8.0, right: 8.0),
          //   child: Container(
          //       height: 250.0,
          //       width: double.infinity,
          //       child: const Text(
          //         "",
          //       ),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: kPrimaryColor)),
          // ),
//           Flexible(
//             flex: 1,
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance.collection('post').snapshots(),
//               builder: (context, snapshot) {
//                 return ListView.builder(
//                   itemCount: snapshot.data.docs.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot mypost = snapshot.data!.docs[index];
//                     return Stack(
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 300.0,
//                               child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 8.0, bottom: 8.0),
//                                   child: Material(
//                                     color: Colors.white,
//                                     elevation: 14.0,
//                                     shadowColor: kPrimaryColor,
//                                     child: Center(
//                                         child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         children: <Widget>[
//                                           Container(
//                                             width: MediaQuery.of(context)
//                                                 .size
//                                                 .width,
//                                             height: 200.0,
//                                             child: Image.network(
//                                               "https://images.unsplash.com/photo-1618961734760-466979ce35b0?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032",
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 10.0,
//                                           ),
//                                           Text(
//                                             '${mypost['title']}',
//                                             style: const TextStyle(
//                                                 fontSize: 20.0,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           const SizedBox(
//                                             height: 10.0,
//                                           ),
//                                           Text(
//                                             '${mypost['subtitle']}',
//                                             style: const TextStyle(
//                                                 fontSize: 16.0,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: kPrimaryAccentColor),
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
