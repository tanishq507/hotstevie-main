// import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageService {
  var fireins = FirebaseFirestore.instance;

  Future<void> addUser(inputData) {
    return fireins
        .collection('users')
        .add(inputData)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateUser(inputData) {
    return fireins
        .collection('users')
        .doc(inputData['id'])
        .update(inputData)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> addObject(inputData) {
    return fireins
        // .doc(inputData['id'])
        .collection('objects')
        .add(inputData)
        .then((value) => print("Object Added"))
        .catchError((error) => print("Failed to add object: $error"));
  }

  Future<void> addInventry(inputData) {
    return fireins
        // .doc(inputData['id'])
        .collection('Inventry')
        .add(inputData)
        .then((value) => print("inventry Added"))
        .catchError((error) => print("Failed to add object: $error"));
  }

  Future<void> addObjectToInventry(inputData) {
    return fireins
        .doc(inputData['id'])
        .collection('Inventry')
        .doc(inputData['inventryId'])
        .collection('objects')
        .add(inputData)
        .then((value) => print("Object Added to Inventry"))
        .catchError(
            (error) => print("Failed to add object to Inventry: $error"));
  }

//fetch the object from the firestore
  Future<Map<String, dynamic>> fetchObject(String docId) async {
  DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
    .collection('objects')
    .doc(docId)
    .get();

  if (docSnapshot.exists) {
    return docSnapshot.data() as Map<String, dynamic>;
  } else {
    throw Exception('Document does not exist on the database');
  }
}
//either print using the value from.(then) or remove everything after and return the object
}
