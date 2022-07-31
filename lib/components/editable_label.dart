import 'package:flutter/material.dart';

class EditableLabel extends StatelessWidget {
  EditableLabel({Key? key, this.onChanged, this.style, this.readOnly = false})
      : super(key: key);

  bool readOnly;
  final Function(String)? onChanged;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: style,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
