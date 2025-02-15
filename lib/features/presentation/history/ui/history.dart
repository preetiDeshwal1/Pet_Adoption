import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../model/history_model.dart';

class PetHistoryScreen extends StatelessWidget {
  const PetHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Purchase History"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final pet = history[index];

          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: pet.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      pet.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pet.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pet.breed,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            // color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.cake,
                                size: 16, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text("${pet.age} years old"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money,
                                size: 16, color: Colors.green),
                            const SizedBox(width: 4),
                            Text(
                              pet.price,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                size: 16, color: Colors.blueGrey),
                            const SizedBox(width: 4),
                            Text(
                              DateFormat.yMMMd()
                                  .format(pet.dateTime), // Formatting Date
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
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
