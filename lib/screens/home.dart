import "package:flutter/material.dart";
import "package:flutter_application_test/shared/menu_bottom.dart";
import "package:flutter_application_test/shared/menu_drawer.dart";
import "package:flutter_application_test/shared/navbar.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          title: '',
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/earth.jpg'), fit: BoxFit.cover)),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70),
                  child: const Text(
                    'Fitness App',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.blueGrey)
                    ]),
                  )))),
    );
  }
}
