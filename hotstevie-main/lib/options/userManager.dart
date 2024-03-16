import 'package:cloud_firestore/cloud_firestore.dart';

// create update read list addInventoryToUser

class UserManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String userId, String userName, String profilePic, List<String> inventoryId) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': userName,
        'profilePic': profilePic,
        'userId': userId,
        'inventoryId': inventoryId,
      });
    } catch (e) {
      print("Error creating user: $e");
      throw e;
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('users').doc(userId).update(updatedData);
    } catch (e) {
      print("Error updating user: $e");
      throw e;
    }
  }

  Future<Map<String, dynamic>> readUser(String userId) async {
    try {
      final DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userId).get();

      if (userSnapshot.exists) {
        return userSnapshot.data() as Map<String, dynamic>;
      } else {
        throw Exception("User with ID $userId not found");
      }
    } catch (e) {
      print("Error reading user: $e");
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> listUsers() async {
  try {
    final QuerySnapshot usersSnapshot = await _firestore.collection('users').get();

    return usersSnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();
  } catch (e) {
    print("Error listing users: $e");
    throw e;
  }
}

Future<void> addInventoryToUser(String userId, String inventoryId) async {
  try {
    DocumentReference userRef = _firestore.collection('users').doc(userId);
    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot userSnapshot = await transaction.get(userRef);
      if (!userSnapshot.exists) {
        throw Exception("User does not exist!");
      }
      Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
      List<String> inventoryIds = List<String>.from(userData['inventoryIds'] ?? []);
      inventoryIds.add(inventoryId);
      transaction.update(userRef, {'inventoryIds': inventoryIds});
    });
  } catch (e) {
    print("Error adding inventory to user: $e");
    throw e;
  }
}
}
