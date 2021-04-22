import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DbHelper {
  final _auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  get collectionReference => users;

  Future registerUser(email, password) async {
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
    return user;
  }

  Future loginUser(email, password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Stream createUsersStream() {
    Stream documentStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .snapshots();

    return documentStream;
  }

  Future findDevelopers(devName) async {
    final Query query = users.where('name', isEqualTo: '$devName');
    QuerySnapshot querySnapshot = await query.get();

    final myData = querySnapshot.docs;
    final myList = [[], []];

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    for (var i = 0; i < allData.length; i++) {
      myList[0].add(myData[i].id);
      myList[1].add(allData[i]);
    }

    return myList;
  }

  void followUser(followedUserId, followedUserEmail) {
    // Add found user's email to following collection
    users.doc(_auth.currentUser.uid).update({
      'following': FieldValue.arrayUnion([followedUserEmail])
    });

    // Adds current user's email to followers collection.
    users.doc(followedUserId).update({
      'followers': FieldValue.arrayUnion([_auth.currentUser.email])
    });
  }

  void unfollowUser(unfollowedUserId, unfollowedUserEmail) {
    // Remove found user from following collection
    users.doc(_auth.currentUser.uid).update({
      'following': FieldValue.arrayRemove([unfollowedUserEmail])
    });

    // Remove current user from followers collection
    users.doc(unfollowedUserId).update({
      'followers': FieldValue.arrayRemove([_auth.currentUser.email])
    });
  }

  bool checkFollowing(foundUserEmail) {
    final usersFollowing = _auth.currentUser.uid;
    for (var user in usersFollowing){
      if (user == foundUserEmail){
        return true;
      } else {
        return false;
      }
    }

    //TODO Finish this
    // This function will check if the user looking at the profile
    // is already following it. If so it returns true, if not then it returns false
    // so that the button can be responsive.
  }
}
