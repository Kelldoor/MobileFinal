import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:petersfinal/ItemDetailPage.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

// Create list for items
class _ItemListPageState extends State<ItemListPage> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // API call to fetch data for card information
  Future<void> fetchData() async {
    try {
      final response = await Dio().get('https://dogapi.dog/api/v2/breeds');
      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          items = List.from(data['data']);
        });
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  // Heading for item displaying
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              fetchData();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Items reloaded'), // Reload button on top of the application
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      // Container for gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final attributes = item['attributes'];
              // Cards for each of the ten dog breed details
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(attributes['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${item['id']}'),
                      Text('Hyperallergenic: ${attributes['hypoallergenic']}'),
                      Text('Min Lifespan: ${attributes['life']['min']} years'),
                      Text('Max Lifespan: ${attributes['life']['max']} years'),
                    ],
                  ),
                  onTap: () {
                    // Navigates to specific dog breed after tapping
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemDetailPage(item: item, groupData: item),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
