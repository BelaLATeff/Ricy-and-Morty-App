import 'package:flutter/material.dart';

class DividerHorizontal extends StatelessWidget {
  final String info;
  const DividerHorizontal({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 3,
          width: 70,
          color: Colors.black12,
        ),
        Text(
          info,
          style: const TextStyle(fontSize: 20, color: Colors.black38),
        ),
        Container(
          height: 3,
          width: 70,
          color: Colors.black12,
        ),
      ],
    );
  }
}
