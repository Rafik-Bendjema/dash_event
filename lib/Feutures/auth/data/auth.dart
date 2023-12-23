import 'package:dash_event/Feutures/auth/data/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  static UserModel? _userModel;
  static UserModel? get userModel => _userModel;
  static set _setUserModel(UserModel? u) => _userModel = u;

  static Future<void> setuser() async {
    var value = await FirebaseFirestore.instance
        .collection("Users")
        .where("id", isEqualTo: Auth().currentUser!.uid)
        .get();
      _setUserModel = UserModel.fromMap(value.docs.first.data());
    
  }

  Future<void> signInWithEMailAndPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    await setuser();
  }

  Future<void> resetPass() async {
    await _auth.sendPasswordResetEmail(email: "drboucharebsarah@gmail.com");
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _auth.currentUser!.updateDisplayName(name);
    UserModel user = UserModel(
      uid: _auth.currentUser!.uid,
      name: name,
      email: email,
      profilePic: _auth.currentUser!.photoURL,
      age: 0
    );
    await _firestore.collection("users").add(user.toMap());
    _setUserModel = user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
