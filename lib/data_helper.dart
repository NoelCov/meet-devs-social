import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'db_helper.dart';

class DataFunctions extends ChangeNotifier {
  final DbHelper db = DbHelper();
  final CollectionReference usersRef = DbHelper().collectionReference;


  Future<List> getUsers(String name) async {
    return await db.findDevelopers(name);
  }
}