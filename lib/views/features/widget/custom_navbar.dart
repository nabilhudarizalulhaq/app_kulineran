import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomNavbar({super.key});

  @override
  _CustomNavbarState createState() => _CustomNavbarState();

  // Definisikan tinggi AppBar di sini
  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class _CustomNavbarState extends State<CustomNavbar> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left_rounded,
          size: 50,
        ),
      ),
      actions: [
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.black,
            size: 30,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
