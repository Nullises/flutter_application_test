import "package:flutter/material.dart";
import "package:flutter_application_test/screens/bmi.dart";
import "package:flutter_application_test/screens/home.dart";
import "package:flutter_application_test/screens/sessions_screen.dart";
import "package:flutter_application_test/screens/weather.dart";

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = ['Home', 'BMI', 'Weather', 'Training'];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.teal,
      ),
      child: Text(
        'Fitness Lifestyle',
        style: TextStyle(color: Colors.white70, fontSize: 24),
      ),
    ));
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const Home();
              break;
            case 'BMI':
              screen = const Bmi();
            case 'Weather':
              screen = const Weather();
            case 'Training':
              screen = const SessionsScreen();
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }
    return menuItems;
  }
}
