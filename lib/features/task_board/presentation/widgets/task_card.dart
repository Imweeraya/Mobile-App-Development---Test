
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String goal;
  final String status;

  const TaskCard({super.key, required this.title, required this.description, required this.goal, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                _buildStatusLabel(status),
              ],
            ),
            SizedBox(height: 8),
            Text("description : $description", style: TextStyle(color: Colors.grey[700])),
            Text("goal : $goal", style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusLabel(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(235, 235, 235, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(status.replaceAll('_', ' ') , style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color.fromRGBO(110, 110, 110, 1),)),
    );
  }
}
