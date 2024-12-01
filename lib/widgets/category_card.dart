import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(Icons.add_business_outlined, size: 40, color: Colors.green[700]),
        ),

        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            category,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
