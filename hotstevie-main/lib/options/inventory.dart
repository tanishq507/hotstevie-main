import 'package:cloud_firestore/cloud_firestore.dart';

// create update read list

class InventoryManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createInventory(String ownerId, List<String> objectIds) async {
  try {
    DocumentReference docRef = await _firestore.collection('inventory').add({
      'ownerId': ownerId,
      'objectIds': objectIds,
    });
    return docRef.id;
  } catch (e) {
    print("Error creating inventory: $e");
    throw e;
  }
}

  Future<void> updateInventory(String inventoryId, List<String> addedObjectIds, List<String> removedObjectIds) async {
    try {
      final DocumentReference inventoryRef = _firestore.collection('inventory').doc(inventoryId);

      // Update the inventory by adding and removing objectIds
      await inventoryRef.update({
        'objectIds': FieldValue.arrayUnion(addedObjectIds),
      });

      await inventoryRef.update({
        'objectIds': FieldValue.arrayRemove(removedObjectIds),
      });
    } catch (e) {
      print("Error updating inventory: $e");
      throw e;
    }
  }

  Future<List<String>> readInventory(String inventoryId) async {
    try {
      final DocumentSnapshot inventorySnapshot = await _firestore.collection('inventory').doc(inventoryId).get();

      if (inventorySnapshot.exists) {
        final Map<String, dynamic> data = inventorySnapshot.data() as Map<String, dynamic>;
        final List<String> objectIds = List<String>.from(data['objectIds'] ?? []);

        return objectIds;
      } else {
        throw Exception("Inventory with ID $inventoryId not found");
      }
    } catch (e) {
      print("Error reading inventory: $e");
      throw e;
    }
  }

  Future<Map<String, List<String>>> listInventory(String ownerId) async {
  Map<String, List<String>> inventoryMap = {};

  try {
    final QuerySnapshot inventorySnapshot = await _firestore.collection('inventory').where('ownerId', isEqualTo: ownerId).get();

    if (inventorySnapshot.docs.isNotEmpty) {
      for (final DocumentSnapshot doc in inventorySnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final List<String> objectIds = List<String>.from(data['objectIds'] ?? []);

        inventoryMap[doc.id] = objectIds;
      }
    } else {
      print("No inventory found for owner ID $ownerId");
    }
  } catch (e) {
    print("Error listing inventory: $e");
    throw e;
  }

  return inventoryMap;
}
}
