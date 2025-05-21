import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final String? suffix;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffix
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          if (suffix != null) ...[
            SizedBox(width: 5),
            Text(suffix!)
          ]
        ],
      )
    );
  }
}