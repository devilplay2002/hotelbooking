import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpeningScreen(),
    );
  }
}

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://www.businessinsider.in/photo/photo/106097792/106097792.jpg?imgsize',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Hotel',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('View Rooms'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Rooms'),
      ),
      body: ListView(
        children: [
          RoomListItem(
              'Deluxe Room', 'Beautiful deluxe room with a view', 8000),
          RoomListItem('Standard Room', 'Comfortable standard room', 4000),
          RoomListItem('Twin Room', 'Perfect for spending time alone', 5000),
          RoomListItem(
              'Suite', 'Beautiful and comfy room with a sea view', 9000),
        ],
      ),
    );
  }
}

class RoomListItem extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  RoomListItem(this.name, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
      trailing: Text('\$$price/night'),
      onTap: () {
        // Navigate to RoomDetailsScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomDetailsScreen(name, description, price),
          ),
        );
      },
    );
  }
}

class RoomDetailsScreen extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  RoomDetailsScreen(this.name, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 16),
            Text('Price: \$$price/night',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement room booking logic here
                // For simplicity, this example just shows a dialog
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text('Room Booked!'),
                        content: Text('You have successfully booked $name.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                );
              },
              child: Text('Book Room'),
            ),
          ],
        ),
      ),
    );
  }
}