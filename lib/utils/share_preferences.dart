import 'package:shared_preferences/shared_preferences.dart';

void setLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('key', 'value');
}

void getLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value = prefs.getString('key');
  print(value); // Output: value
}
