class UserModel {
  String? uid;
  String? email;
  String? name;
  String? district;
  String? bloodGroup;
  List<dynamic>? vaccines;

  //UserModel({this.uid, this.email, this.name, this.district, this.bloodGroup});
  UserModel();
  //UserModel(this.uid, this.email, this.name, this.district, this.bloodGroup);
  //data from server
  factory UserModel.fromMap(Map<String, dynamic> map) {
    final um = UserModel();
    um.uid = map["uid"];
    um.email = map["email"];
    um.name = map["name"];
    um.district = map["district"];
    um.bloodGroup = map["bloodGroup"];
    um.vaccines = map["vaccines"];
    return um;
    //print(map["uid"]);
    // return UserModel(map['uid'], map['email'], map['name'], map['district'],
    //     map['bloodGroup']);
  }

  //sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'district': district,
      'bloodGroup': bloodGroup,
    };
  }
}
