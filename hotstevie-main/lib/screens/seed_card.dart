import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotstevie/screens/custom_plants_column.dart';

class SeedCard extends StatefulWidget {
  const SeedCard({Key? key}) : super(key: key);

  @override
  _SeedCardState createState() => _SeedCardState();
}

class seedCard extends StatelessWidget {
  // Define variables to hold item details
  final String itemName;
  final double price;
  final int quantity;

  // Constructor to initialize item details
  const seedCard({
    Key? key,
    required this.itemName,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  // Function to handle adding item to cart
  void addToCart() {
    // Implement logic to add item to cart
    print('Added $itemName to cart');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent, // Change card color as needed
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Card content here
            Text(itemName),
            Text('Price: \$${price.toStringAsFixed(2)}'),
            Text('Quantity: $quantity'),
            ElevatedButton(
              onPressed:
                  addToCart, // Call addToCart function when button is pressed
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeedCardState extends State<SeedCard> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('objects').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Access data from the snapshot
        List<DocumentSnapshot> documents = snapshot.data!.docs;

        // Return a widget to display the data
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.brown.shade900,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(45)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/plant.jpg', // Replace 'tool_image.png' with your asset image path
                width: 70,
                height: 90,
              ),
              SizedBox(height: 50),
              Text(
                "Seeds",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;

                  // Extract data fields
                  String name = data['name'] ?? '';
                  double price = (data['price'] ?? 0.0).toDouble();
                  double quantity = (data['quantity'] ?? 0).toDouble();
                  double weight = (data['weight'] ?? 0.0).toDouble();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPlantsColumn(
                        color: Colors.green,
                        figures: name,
                        headings: 'name',
                        icon: Icons.arrow_drop_down,
                      ),
                      CustomPlantsColumn(
                        color: Colors.brown,
                        figures: price.toString(),
                        headings: 'price',
                        icon: Icons.arrow_drop_up,
                      ),
                      Row(
                        children: [
                          Text(
                            'Quantity:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          DropdownButton<int>(
                            value: selectedQuantity,
                            onChanged: (newValue) {
                              setState(() {
                                selectedQuantity = newValue!;
                              });
                            },
                            items: List.generate(10, (index) {
                              return DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text((index + 1).toString()),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Visibility(
                visible: selectedQuantity > 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform action when "Add to Cart" button is pressed
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
