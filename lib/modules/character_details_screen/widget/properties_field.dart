import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PropertiesField extends StatelessWidget {
  final String keyString;
  final String valueString;
  const PropertiesField(
      {super.key, required this.keyString, required this.valueString});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: ,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            keyString,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.center,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              overflow: TextOverflow.ellipsis,
              valueString,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
