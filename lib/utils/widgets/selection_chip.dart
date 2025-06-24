import 'package:flutter/material.dart';

class SelectionChip extends StatelessWidget{
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionChip(
    {
      required this.label,
      required this.isSelected,
      required this.onTap
    }
  );

@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE8F5E9)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

