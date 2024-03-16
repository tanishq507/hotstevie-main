import 'package:flutter/material.dart';
import 'package:hotstevie/screens/custom_plants_column.dart';
import 'package:hotstevie/screens/item_added_cart.dart';

class PlantsCard extends StatelessWidget {
  const PlantsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your desired function or navigation logic here
        print('PlantsCard tapped!');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.brown.shade700,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(45)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Image.asset(
                  'assets/plant.jpg', // Change to your asset path
                  height: 100,
                ),
                SizedBox(width: 16), // Adjust spacing between image and text
                Text(
                  "cabage", // Replace with actual product name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 20), // Add space between product name and other widgets
            Text(
              "Plants and trees",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPlantsColumn(
                  color: Colors.green,
                  figures: '300',
                  headings: 'Price',
                  icon: Icons.arrow_drop_down,
                ),
                CustomPlantsColumn(
                  color: Colors.brown,
                  figures: '131',
                  headings: 'quantity',
                  icon: Icons.arrow_drop_up,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Create an instance of AddedItemCard with item details
                    AddedItemCard addedItem = AddedItemCard(
                      itemName:
                          "Product Name", // Replace with actual product name
                      itemImage:
                          'assets/plant.jpg', // Replace with actual asset path
                      price: 10.99, // Replace with actual price
                      quantity: 1, // Replace with actual quantity
                      description:
                          "Description of the product", // Replace with actual description
                    );

                    // Show the AddedItemCard widget
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return addedItem;
                      },
                    );
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
