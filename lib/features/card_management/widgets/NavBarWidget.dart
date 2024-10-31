import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () => onItemTapped(0), // Aksi untuk tombol Home
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () => onItemTapped(1), // Aksi untuk tombol Notifikasi
            ),
          ],
        ),
      ),
    );
  }
}
