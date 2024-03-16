import 'package:cloud_firestore/cloud_firestore.dart';

class ObjectService {
  final CollectionReference objectsCollection =
      FirebaseFirestore.instance.collection('objects');

  Future<void> addObject(String name, double price, double weight, int quantity) async {
    await objectsCollection.add({
      'name': name,
      'price': price,
      'weight': weight,
      'quantity': quantity,
    });
  }

  Future<void> updateObject(String docID, String name, double price, double weight, int quantity) async {
    await objectsCollection.doc(docID).update({
      'name': name,
      'price': price,
      'weight': weight,
      'quantity': quantity,
    });
  }

  Future<void> deleteObject(String docID) async {
    await objectsCollection.doc(docID).delete();
  }

  Future<List<Object>> getObjects() async {
    QuerySnapshot querySnapshot = await objectsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Object(
        docID: doc.id,
        name: doc['name'],
        price: doc['price'],
        weight: doc['weight'],
        quantity: doc['quantity'],
      );
    }).toList();
  }

  
}

class Object {
  final String docID;
  final String name;
  final double price;
  final double weight;
  final int quantity;

  Object({
    required this.docID,
    required this.name,
    required this.price,
    required this.weight,
    required this.quantity,
  });
}
