import 'package:flutter/material.dart';
import 'package:new_coffee/modales.dart/coffee_model.dart';
import 'package:new_coffee/screens.dart/product_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<ProductModel> products = [
    ProductModel(
      name: "Car Wash",
      image: "assets/images/carwash.jpg",
      price: 499,
      description: "Complete exterior and interior car cleaning service.",
    ),

    ProductModel(
      name: "Car Detailing",
      image: "assets/images/detailing.jpg",
      price: 1499,
      description: "Premium car detailing service for your vehicle.",
    ),

    ProductModel(
      name: "Oil Change",
      image: "assets/images/oil.jpg",
      price: 999,
      description: "Professional engine oil replacement service.",
    ),

    ProductModel(
      name: "AC Service",
      image: "assets/images/ac.jpg",
      price: 799,
      description: "Complete vehicle AC inspection and service.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Services"),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),

        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    davthejasproducts: product,
                  ),
                ),
              );
            },

            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Image.asset(
                      product.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "₹${product.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}