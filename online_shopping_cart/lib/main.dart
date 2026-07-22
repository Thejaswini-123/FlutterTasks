import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
    State <MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {

  final List <String> products = [
    "Laptop",
    "Mouse",
    "Shoes",
    "Watch",
    "Chain"
  ];

  final Set <String> categories = {
    "Electronics",
    "Footwear",
    "Accessories"
  };

  final Map <String,int> priceList = {
    "Laptop": 60000,
    "Mouse": 5000,
    "Shoes": 2000,
    "Watch": 3000,
    "Chain": 1000
  };

  final List <String> cart = [];
  int totalBill = 0;
  double discount = 0;
  double finalBill = 0;

  void addToCart(String product) {

    setState(() {
      cart.add(product);
      totalBill += priceList[product]!;

      if(totalBill >= 50000) {
        discount = totalBill * 0.10;
      } else {
        discount = 0;
      }
      finalBill = totalBill - discount;

    });
  }

  @override
    Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(
          title: const Text("Online Shopping Cart"),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),

        body: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Available Products",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Expanded(

                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    String product = products[index];

                    return Card(
                      child: ListTile(
                        title: Text(product),
                        subtitle: Text("Price : ${priceList[product]}"),

                        trailing: ElevatedButton(
                          onPressed: () {
                            addToCart(product);
                          },

                          child: const Text("Add"),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Divider(),

              Text(
                "Categories : ${categories.join(", ")}",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 8),

              Text(
                "Number of Items in Cart : ${cart.length}",
                style: const TextStyle(fontSize: 18),
              ),

              Text(
                "Total Bill : ₹$totalBill",
                style: const TextStyle(fontSize: 18),
              ),

              Text(
                "Discount : ₹$discount",
                style: const TextStyle(fontSize: 18),
              ),

              Text(
                "Final Bill : ₹$finalBill",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  }



