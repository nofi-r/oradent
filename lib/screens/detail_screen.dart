

import 'package:flutter/material.dart';
import '../main.dart';
import 'home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Treatment treatment;

  const DetailScreen({super.key, required this.treatment});

  void confirmBooking(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(
          'Confirm booking?',
          style: TextStyle(
            color: navyBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Do you want to book an appointment for ${treatment.name}?',
          style: const TextStyle(color: Colors.black54, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Appointment request sent for ${treatment.name}',
                  ),
                ),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Widget infoTile(String image, String label, String value) {
    return ListTile(
      leading: Image.asset(image, width: 26, height: 26),
      title: Text(
        label,
        style: const TextStyle(color: Colors.black54, fontSize: 14),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          color: navyBlue,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget infoCard({required Widget child}) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: iceBlue.withValues(alpha: 0.6)),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          treatment.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          Center(
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: iceBlue.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset(treatment.image, fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            treatment.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: navyBlue,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            treatment.category,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            treatment.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 24),
          infoCard(
            child: Column(
              children: [
                infoTile(
                  'assets/images/icon_clock.png',
                  'Duration',
                  treatment.duration,
                ),
                const Divider(height: 1),
                infoTile(
                  'assets/images/icon_price.png',
                  'Price',
                  treatment.price,
                ),
                const Divider(height: 1),
                infoTile(
                  'assets/images/icon_followup.png',
                  'Follow-up',
                  treatment.followUp,
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: () => confirmBooking(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text('Book Appointment'),
          ),
        ],
      ),
    );
  }
}


