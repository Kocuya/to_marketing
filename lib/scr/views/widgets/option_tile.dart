import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const OptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 227, 227, 227), width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}