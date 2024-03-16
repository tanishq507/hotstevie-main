import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotstevie/screens/custom_plants_column.dart';

class ToolCard extends StatefulWidget {
  const ToolCard({Key? key}) : super(key: key);

  @override
  _ToolCardState createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard> {
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
              SizedBox(height: 50),
              Row(
                children: [
                  Image.asset(
                    'assets/plant.jpg', // Change to your asset path
                    height: 100,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Tools",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
