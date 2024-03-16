import 'package:flutter/material.dart';
import 'package:hotstevie/options/inventory.dart';
import 'package:hotstevie/options/userManager.dart';
import 'package:hotstevie/screens/AddItem.dart';
import 'package:hotstevie/screens/dashboard.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key}) : inventory = {}, super(key: key);

void _createInventory() async {
// String ownerID = 'ownerId2';
String objectId1 = 'objectId5';
String objectId2 = 'objectId6';
String userId = 'someId'; // replace with your user ID
// String inventoryId = 'yourInventoryId';
Future <String> inventoryid = InventoryManager().createInventory(userId, [objectId1, objectId2]);
await UserManager().addInventoryToUser(userId, inventoryid as String);
}

Map<String, List<String>> inventory;

Future<void> _listInventory() async {
  String ownerId = 'ownerId2';
  
  inventory = await InventoryManager().listInventory(ownerId);
  inventory.forEach((inventoryId, objectIds) {
    print('Inventory ID: $inventoryId');
    print('Object IDs: $objectIds');
  });
}


void finduser() async {
  try {
    List<Map<String, dynamic>> users = await UserManager().listUsers();
    users.forEach((user) {
      print('User: $user');
    });
  } catch (e) {
    print('Failed to list users: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const TextField(
          //   decoration: InputDecoration(
          //     labelText: 'Username',
          //   ),
          // ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _createInventory,
          child: const Text('Create Inventory'),
          ),

          const SizedBox(height: 16),
          ElevatedButton(onPressed: _listInventory,
          child: const Text('list Inventory'),
          ),

          const SizedBox(height: 16),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeView()),
              // );
              // Perform login with username and password
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Perform Google login
            },
            child: const Text('Login with Google'),
          ),
          ElevatedButton(
            onPressed: () {
              // NAVIGATE TO OBJ
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewObjScreen()),
              );
            },
            child: const Text('TO ADD OBJ'),
          ),
          Text(inventory.toString()),
          ElevatedButton(onPressed: finduser,
           child: Text('Find User'),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Analytics()),
            );
          }, child: Text('  to dashboard'),
          ),
        ],
      )
    );
  }
}