import 'package:shared_preferences/shared_preferences.dart';

import '../model/person.dart';

class SaveSharedPreference {
  void saveUser(int id, String name, String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("id", id);
    await prefs.setString("name", name);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  Future<Person?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt("id");
    final String? name = prefs.getString("name");
    final String? email = prefs.getString("email");
    final String? password = prefs.getString("password");

    if (id != null &&
        name != null &&
        email != null &&
        password != null) {
      return Person(
        id: id,
        name: name,
        email: email,
        password: password,
      );
    }
    return null;
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("id");
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("id");
    await prefs.remove("name");
    await prefs.remove("email");
    await prefs.remove("password");
  }

}
