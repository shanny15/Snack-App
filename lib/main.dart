import 'package:flutter/material.dart';

void main() => runApp(SnackListApp());

class SnackListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Snack> snacks = [
    Snack(name: 'Chips', image: 'images/chips.jpg', price: 2.99),
    Snack(name: 'Popcorn', image: 'images/popcorn.jpg', price: 3.99),
    Snack(name: 'Chocolate', image: 'images/chocolate.jpg', price: 1.99),
    Snack(name: 'Candy', image: 'images/candy.jpg', price: 0.99),
    Snack(name: 'Pretzels', image: 'images/pretzels.jpg', price: 2.49),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack List'),
      ),
      body: ListView.builder(
        itemCount: snacks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Image.asset(snacks[index].image),
              title: Text(snacks[index].name),
              trailing: Text('\$${snacks[index].price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(snack: snacks[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Snack snack;

  const DetailScreen({Key? key, required this.snack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snack.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              snack.image,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              '\$${snack.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              snack.description,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Snack {
  final String name;
  final String image;
  final double price;
  final String description;

  Snack({
    required this.name,
    required this.image,
    required this.price,
    this.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  });
}
