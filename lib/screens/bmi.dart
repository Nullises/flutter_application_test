import "package:flutter/material.dart";
import "package:flutter_application_test/shared/menu_bottom.dart";
import "package:flutter_application_test/shared/menu_drawer.dart";
import "package:flutter_application_test/shared/navbar.dart";

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(),
      ),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
