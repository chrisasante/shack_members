import 'package:flutter/material.dart';

class DetailsList extends StatelessWidget {
  final IconData icon;
  final String info;
  const DetailsList({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(info)
      ],
    );
  }
}
