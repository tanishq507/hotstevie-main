import 'package:flutter/material.dart';

class AddedItemCard extends StatelessWidget {
  final String itemName;
  final String itemImage; // Path to the image asset
  final double price;
  final int quantity;
  final String description;

  AddedItemCard({
    required this.itemName,
    required this.itemImage,
    required this.price,
    required this.quantity,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Image.asset(
                  itemImage,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  'Price: \$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Close the card and go back to the previous screen
                        Navigator.pop(context);
                      },
                      child: Text('Go Back'),
                    ),
                    SizedBox(width: 8), // Add some spacing between buttons
                    TextButton(
                      onPressed: () {
                        // Handle edit button press
                        print('Edit button pressed');
                        // Implement editing logic here
                      },
                      child: Text('Edit'),
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Handle remove button press
                        print('Remove button pressed');
                        // Implement removing logic here
                      },
                      child: Text('Remove'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: IconButton(
              onPressed: () {
                // Implement card icon functionality
              },
              icon: Icon(Icons.credit_card),
            ),
          ),
        ],
      ),
    );
  }
}
