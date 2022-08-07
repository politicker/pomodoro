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
      width: 75,
      height: 75,
      child: IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          icon,
          size: 75,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
