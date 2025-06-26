import 'package:flutter/material.dart';

class EmptyMedicineWidget extends StatelessWidget {
  const EmptyMedicineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medication_liquid_outlined,
            size: 80,
            color: Colors.blueGrey,
          ),
          SizedBox(height: 20),
          Text(
            'Henüz ilaç eklenmedi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Yeni bir ilaç eklemek için + butonuna dokunun.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}