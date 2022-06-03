import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imwell/constants.dart';
import 'package:imwell/models/user_model.dart';

import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  //our form key
  final _formkey = GlobalKey<FormState>();
  //editing controller
  final NameEditingController = TextEditingController();
  final districtEditingController = TextEditingController();
  final birthDayEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final phNoEditingController = TextEditingController();
  final bloodGroupEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Name field
    final Namefield = TextFormField(
        autofocus: false,
        controller: NameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Name cannot be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          NameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Name',
          fillColor: kPrimaryLightColor,
        ));

    //email field
    final emailfield = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter your email");
          }
          //reg expression email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
            ),
            hintText: 'email',
            fillColor: kPrimaryLightColor,
          );
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Email',
          fillColor: kPrimaryLightColor,
        ));

    //district field
    final districtfield = TextFormField(
        autofocus: false,
        controller: districtEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("This field cannot be empty");
          }
          return null;
        },
        onSaved: (value) {
          districtEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'District',
          fillColor: kPrimaryLightColor,
        ));

    //Birthday field
    final birthDayfield = TextFormField(
        autofocus: false,
        controller: birthDayEditingController,
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value!.isEmpty) {
            return ("This field cannot be empty");
          }
          return null;
        },
        onSaved: (value) {
          birthDayEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Birth Day',
          fillColor: kPrimaryLightColor,
        ));

    //Personal health number
    final phNofield = TextFormField(
        autofocus: false,
        controller: phNoEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("This field cannot be empty");
          }
          return null;
        },
        onSaved: (value) {
          phNoEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Health Number',
          fillColor: kPrimaryLightColor,
        ));

    final bloodGroupfield = TextFormField(
        autofocus: false,
        controller: bloodGroupEditingController,
        keyboardType: TextInputType.text,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return ("This field cannot be empty");
        //   }
        //   return null;
        // },
        onSaved: (value) {
          bloodGroupEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Blood Group',
          fillColor: kPrimaryLightColor,
        ));

    //password field
    final passwordfield = TextFormField(
        obscureText: true,
        autofocus: false,
        controller: passwordEditingController,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Password',
          fillColor: kPrimaryLightColor,
        ));

    //password confirm field
    final passwordConfirmfield = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 16),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Confirm Password',
          fillColor: kPrimaryLightColor,
        ));

    //Sign up button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: (() {
            signUp(emailEditingController.text, passwordEditingController.text);
          }),
          child: const Text("Sign Up",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Namefield,
                    const SizedBox(
                      height: 10,
                    ),
                    emailfield,
                    const SizedBox(
                      height: 10,
                    ),
                    phNofield,
                    const SizedBox(
                      height: 10,
                    ),
                    districtfield,
                    const SizedBox(
                      height: 10,
                    ),
                    birthDayfield,
                    const SizedBox(
                      height: 10,
                    ),
                    bloodGroupfield,
                    const SizedBox(
                      height: 10,
                    ),
                    passwordfield,
                    const SizedBox(
                      height: 10,
                    ),
                    passwordConfirmfield,
                    const SizedBox(
                      height: 15,
                    ),
                    signupButton
                  ],
                )),
          ),
        )),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore
    //calling user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writting all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = NameEditingController.text;
    userModel.district = districtEditingController.text;
    userModel.bloodGroup = bloodGroupEditingController.text;
    userModel.vaccines = [
      {
        "vaccineId": "10",
        "centreId": "acd456",
      }
    ];

    await firebaseFirestore.collection("users").doc(user.uid)
        //.set(userModel.toMap());
        .set({
      "email": user.email,
      "uid": user.uid,
      "name": NameEditingController.text,
      "district": districtEditingController.text,
      "bloodGroup": bloodGroupEditingController.text,
      "vaccines": []
    });
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
