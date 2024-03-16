import 'package:flutter/material.dart';
import 'package:hotstevie/options/firestore.dart';
import 'package:hotstevie/screens/GetItem.dart';
import 'package:hotstevie/screens/roughpage.dart';

class AddNewObjScreen extends StatefulWidget {
  @override
  _AddNewObjScreenState createState() => _AddNewObjScreenState();
}

class _AddNewObjScreenState extends State<AddNewObjScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _addObjectToFirestore() {
    // Perform the Firestore write operation here
    String name = _nameController.text;
    double weight = double.parse(_weightController.text);
    double price = double.parse(_priceController.text);
    int quantity = int.parse(_quantityController.text);

    FirebaseStorageService fs = FirebaseStorageService();
    // Write the object to Firestore
    fs.addObject({
      'name': name,
      'weight': weight,
      'price': price,
      'quantity': quantity,
    });

    // Clear the text fields
    _nameController.clear();
    _weightController.clear();
    _priceController.clear();
    _quantityController.clear();

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Object added to Firestore')),
    );
  }

  void _printObjs() {
    FirebaseStorageService fs = FirebaseStorageService();
    var obj = fs.fetchObject('btegT6kFQre5CpSGuvPP');
    print(obj);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Object'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  // if (value.isEmpty) {
                  //   return 'Please enter a name';
                  // }
                  return null;
                },
              ),
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // if (value.isEmpty) {
                  //   return 'Please enter a weight';
                  // }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // if (value.isEmpty) {
                  //   return 'Please enter a price';
                  // }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // if (value.isEmpty) {
                  //   return 'Please enter a quantity';
                  // }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addObjectToFirestore,
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataDisplayPage()),
                  );
                },
                child: Text('get objs'),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget()),
                );
              }, child: const Text('  to rough page')
              )
            ],
          ),
        ),
      ),
    );
  }
}
