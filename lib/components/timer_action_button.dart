import 'package:flutter/material.dart';

class TimerActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const TimerActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(icon, size: 20),
        onPressed: onPressed,
      ),
    );
  }
}
