import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;

  const ButtonComponent({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Membuat tombol lonjong
        ),
        padding: EdgeInsets.symmetric(
            vertical: 12, horizontal: 30), // Padding untuk proporsi tombol
      ),
      icon: icon != null
          ? Icon(icon, size: 20, color: Colors.white) // Ikon dengan warna putih
          : SizedBox.shrink(),
      label: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
