import 'package:flutter/material.dart';
import 'package:sell_book_final_term/services/local/shared_prefs_splash.dart';
import '../models/splash.dart';
import '../pages/login_page.dart';
import '../services/local/shared_prefs.dart';
import '../components/custom_text_field.dart';
import '../components/customer_item.dart';
import '../pages/detail_bill.dart';
import '../models/customer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.listCustomer});
  final List<Customer> listCustomer;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController nameSearchController = TextEditingController();
  bool isRemoved = false;
  List<Customer> _searchList = [];
  final SharedPrefs _sharedPrefs = SharedPrefs();
  final SharedPrefsSplash _sharedPrefsSplash = SharedPrefsSplash();
  List<Splash> _isLogedList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _searchList = [...widget.listCustomer];
    });
  }

  searchCustomer(String searchText) {
    _searchList = widget.listCustomer
        .where((element) => (element.name ?? '')
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tìm kiếm hóa đơn',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      backgroundColor: Colors.brown.shade400,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.brown.shade800, Colors.brown.shade400],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextFieldCustom(
                    controller: nameSearchController,
                    onChanged: (value) => setState(() => searchCustomer(value)),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ListView.builder(
                        itemCount: _searchList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Customer customer =
                              _searchList.reversed.toList()[index];
                          return CustomerItem(
                            ontap: () async {
                              bool? isRemove = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (
                                    context,
                                  ) =>
                                      DetailBillPage(
                                    customer: customer,
                                  ),
                                ),
                              );
                              if (isRemove ?? false) {
                                isRemoved = true;
                                widget.listCustomer.remove(customer);
                                _searchList.remove(customer);
                                _sharedPrefs.addCustomers(widget.listCustomer);
                                setState(() {});
                              }
                            },
                            name: customer.name,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          fixedColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              tooltip: "Trang chủ",
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
              tooltip: "Tìm kiếm",
            ),
            BottomNavigationBarItem(
              label: 'Logout',
              icon: Icon(Icons.logout),
              tooltip: "Logout",
            ),
          ],
          onTap: (int indexOfItem) {
            if (indexOfItem == 0) {
              Navigator.pop(context, isRemoved);
            }
            if (indexOfItem == 2) {
              showDialog<bool>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('😍'),
                  content: const Text(
                    'Do you want to logout?',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ).then((status) {
                if (status == true) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                  _isLogedList = [Splash(loged: false)];
                  _sharedPrefsSplash.updateLoged(_isLogedList);
                }
              });
            }
          }),
    );
  }
}
