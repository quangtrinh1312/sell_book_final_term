import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/customer.dart';

class SharedPrefs {
  final Future<SharedPreferences> _customerPrefs =
      SharedPreferences.getInstance();

  Future<List<Customer>?> getCustomers() async {
    SharedPreferences prefs = await _customerPrefs;
    String? data = prefs.getString('customers');

    if (data == null) return null;

    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<Customer> customers = maps.map((e) => Customer.fromJson(e)).toList();
    return customers;
  }

  Future<void> addCustomers(List<Customer> customers) async {
    List<Map<String, dynamic>> maps = customers.map((e) => e.toJson()).toList();
    SharedPreferences prefs = await _customerPrefs;
    prefs.setString('customers', jsonEncode(maps));
  }
}
