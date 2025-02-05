import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.label, this.onChanged,
  });
  final String label;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            label: Text(label),
            border: OutlineInputBorder(),
          ),
        ));
  }
}
