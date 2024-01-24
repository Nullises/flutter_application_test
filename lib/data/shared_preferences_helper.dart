import 'dart:convert';
import 'package:flutter_application_test/data/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    preferences.setString(session.id.toString(), jsonEncode(session.toJson()));
  }

  List<Session> getSessions() {
    List<Session> sessions = [];
    Set<String> keys = preferences.getKeys();
    for (String key in keys) {
      if (key != 'counter') {
        Session session =
            Session.fromJson(jsonDecode(preferences.getString(key) ?? ''));
        sessions.add(session);
      }
    }
    return sessions;
  }

  Future setCounter() async {
    int counter = preferences.getInt('counter') ?? 0;
    counter++;
    await preferences.setInt('counter', counter);
  }

  int getCounter() {
    return preferences.getInt('counter') ?? 0;
  }

  Future deleteSession(int id) async {
    return preferences.remove(id.toString());
  }
}
