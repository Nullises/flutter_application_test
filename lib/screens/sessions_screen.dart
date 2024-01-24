import "package:flutter/material.dart";
import "package:flutter_application_test/data/session.dart";
import "package:flutter_application_test/data/shared_preferences_helper.dart";
import "package:flutter_application_test/shared/navbar.dart";
import "package:shared_preferences/shared_preferences.dart";

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper spHelper = SPHelper();

  @override
  void initState() {
    spHelper.init().then((value) => updateScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          title: 'Your Training Sessions',
        ),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSessionDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insert Training Session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: txtDescription,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: txtDuration,
                    decoration: const InputDecoration(hintText: 'Duration'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                    txtDescription.text = '';
                    txtDuration.text = '';
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: saveSession, child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = "${now.year}/${now.month}/${now.day}";
    int id = spHelper.getCounter() + 1;
    Session newSession = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    spHelper.writeSession(newSession).then((_) {
      updateScreen();
      spHelper.setCounter();
    });
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          spHelper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duration: ${session.duration} min'),
        ),
      ));
    }
    return tiles;
  }

  void updateScreen() {
    sessions = spHelper.getSessions();
    setState(() {});
  }
}
