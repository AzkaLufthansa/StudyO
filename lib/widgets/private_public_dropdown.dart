import 'package:flutter/material.dart';

class PrivateDropdown extends StatefulWidget {
  final List<String> classOptions;
  final Function(String selectedClass) onChanged;

  const PrivateDropdown({
    required this.classOptions,
    required this.onChanged,
    super.key,
  });

  @override
  State<PrivateDropdown> createState() => _ClassDropdownState();
}

class _ClassDropdownState extends State<PrivateDropdown> {
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedClass,
      hint: const Text('Public/Private'),
      items: widget.classOptions.map<DropdownMenuItem<String>>((String className) {
        return DropdownMenuItem<String>(
          value: className,
          child: Text(className),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          selectedClass = value;
        });
        if (value != null) widget.onChanged(value);
      },
    );
  }
}
