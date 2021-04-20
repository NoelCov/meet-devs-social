import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DbHelper {
  final _auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future registerUser(email, password) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        final userId = _auth.currentUser.uid;
        users
            .doc(userId)
            .set({
              'bio': 'Your bio',
              'name': 'Your name',
              'title': 'Your title',
              'email': email,
              'posts': [],
              'followers': [],
              'following': [],
            })
            .then((value) => print('User added $userId'))
            .catchError((onError) => print('Failed to add user: $onError'));
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
