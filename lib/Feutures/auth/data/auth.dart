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

  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch (e) {
      print("Error getting current user: $e");
      return null;
    }
  }

  Future<void> signInWithEMailAndPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    await setuser();
  }

  Future<String?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser!.updateDisplayName(name);
      UserModel user = UserModel(
          uid: _auth.currentUser!.uid,
          name: name,
          email: email,
          profilePic: "",
          isadmin: false,
          age: 0);
      await _firestore.collection("users").add(user.toMap());

      await incrementNbrAtt();
      _setUserModel = user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        return "invalid email";
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> signin(String email, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "user not found";
      } else if (e.code == 'wrong-password') {
        return "wrong password";
      } else if (e.code == 'invalid-email') {
        return "invalid email";
      } else {
        return e.message;
      }
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> incrementNbrAtt() async {
    DocumentReference eventDocRef =
        _firestore.collection("Event").doc("6pOFnma5iPrllzbf2wiP");
    await eventDocRef.update({"nbr_attendees": FieldValue.increment(1)});
  }

  Future<List<Map<String, String>>> getAllUsersData() async {
    List<Map<String, String>> usersData = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        // Check if the 'email' and 'name' fields exist in the document
        if (doc.data().containsKey('E-Mail') &&
            doc.data().containsKey('Name')) {
          String email = doc.data()['E-Mail'];
          String name = doc.data()['Name'];

          // Create a map for each user
          Map<String, String> userData = {'name': name, 'email': email};

          usersData.add(userData);
        }
      }

      return usersData;
    } catch (e) {
      // Handle errors here
      print('Error retrieving user data: $e');
      return [];
    }
  }

  void main() async {
    List<Map<String, String>> usersData = await getAllUsersData();
    print('User Data: $usersData');
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
