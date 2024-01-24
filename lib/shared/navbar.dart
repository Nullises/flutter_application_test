import "package:flutter/material.dart";

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required String title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Fitness App',
        style: TextStyle(color: Colors.white70),
      ),
      backgroundColor: Colors.teal,
    );
  }
}
