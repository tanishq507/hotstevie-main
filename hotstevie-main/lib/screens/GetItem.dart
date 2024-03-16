import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display Page'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('objects').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Access data from the snapshot
          List<DocumentSnapshot> documents = snapshot.data!.docs;

          // Return a widget to display the data
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  documents[index].data() as Map<String, dynamic>;

              // Extract data fields
              String name = data['name'] ?? '';
              double price = data['price'] ?? 0.0;
              int quantity = data['quantity'] ?? 0;
              double weight = data['weight'] ?? 0.0;

              // Create a ListTile widget to display the data
              return ListTile(
                title: Text(name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price: \$${price.toStringAsFixed(2)}'),
                    Text('Quantity: $quantity'),
                    Text('Weight: ${weight.toStringAsFixed(2)}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
