import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/splash.dart';

class SharedPrefsSplash {
  final Future<SharedPreferences> _islogedPrefs =
      SharedPreferences.getInstance();

  Future<List<Splash>?> getIsloged() async {
    SharedPreferences prefs = await _islogedPrefs;
    String? data = prefs.getString('isloged');

    if (data == null) return null;

    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<Splash> isLogedList = maps.map((e) => Splash.fromJson(e)).toList();
    return isLogedList;
  }

  Future<void> updateLoged(List<Splash> isLogedList) async {
    List<Map<String, dynamic>> maps = isLogedList.map((e) => e.toJson()).toList();
    SharedPreferences prefs = await _islogedPrefs;
    prefs.setString('isloged', jsonEncode(maps));
  }
}
