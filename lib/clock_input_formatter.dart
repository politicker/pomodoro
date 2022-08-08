import 'package:flutter/services.dart';

class ClockInputFormatter extends TextInputFormatter {
  final String template = "xx:xx";
  final String separator = ":";

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return oldValue;
    }

    if (newValue.text.length > template.length) {
      return oldValue;
    }

    if (!newValue.text.contains(separator)) {
      return oldValue;
    }

    return newValue;
  }
}
