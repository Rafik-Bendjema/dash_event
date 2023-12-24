class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final int? age;
  final String? profilePic;
  final Gender? gender;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.age,
    this.profilePic,
    this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['id'],
      name: map['name'],
      email: map['E-Mail'],
      age: map['age'],
      profilePic: map['profile_pic'],
      gender: map['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'Name': name,
      'E-Mail': email,
      'age': age,
      'profile_pic': profilePic,
      'gender': gender,
    };
  }
}

enum Gender { male, female }
