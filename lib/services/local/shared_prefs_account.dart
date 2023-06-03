import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/account.dart';

class SharedPrefsAccount {
  final Future<SharedPreferences> _accountPrefs =
      SharedPreferences.getInstance();

  Future<List<Account>?> getAccounts() async {
    SharedPreferences prefs = await _accountPrefs;
    String? data = prefs.getString('accounts');

    if (data == null) return null;

    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<Account> accounts = maps.map((e) => Account.fromJson(e)).toList();
    return accounts;
  }

  Future<void> addAccounts(List<Account> accounts) async {
    List<Map<String, dynamic>> maps = accounts.map((e) => e.toJson()).toList();
    SharedPreferences prefs = await _accountPrefs;
    prefs.setString('accounts', jsonEncode(maps));
  }
}
