import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;
  final Map<String, dynamic> groupData;

  ItemDetailPage({required this.item, required this.groupData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['attributes']['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Information for each dog breed from API call
              _buildDetailHeading('Description'),
              _buildDetailRow('ID', item['id']),
              _buildDetailRow('Description', item['attributes']['description']),
              _buildDetailHeading('Hypoallergenic'),
              _buildDetailRow('Hypoallergenic', item['attributes']['hypoallergenic'].toString()), 
              _buildDetailHeading('Lifespan'),
              _buildDetailRow('Min Lifespan', '${item['attributes']['life']['min']} years'),
              _buildDetailRow('Max Lifespan', '${item['attributes']['life']['max']} years'),
              _buildDetailHeading('Weight'),
              _buildDetailRow('Min Male Weight', '${item['attributes']['male_weight']['min']} pounds'),
              _buildDetailRow('Max Male Weight', '${item['attributes']['male_weight']['max']} pounds'),
              _buildDetailRow('Min Female Weight', '${item['attributes']['female_weight']['min']} pounds'),
              _buildDetailRow('Max Female Weight', '${item['attributes']['female_weight']['max']} pounds'),
              _buildDetailHeading('Group (Relationship)'),
              _buildDetailRow('Group ID', groupData['id']),
              _buildDetailRow('Group Type', groupData['type']),

              // Button to go back to items list
              SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Return to items list'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Styling for the data displayed
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
  
  // Styling for data headings 
  Widget _buildDetailHeading(String heading) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        heading,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue), 
      ),
    );
  }
}



