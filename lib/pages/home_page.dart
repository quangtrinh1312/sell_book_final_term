import 'package:flutter/material.dart';
import 'package:sell_book_final_term/models/customer.dart';
import 'package:sell_book_final_term/services/local/shared_prefs_splash.dart';
import '../models/splash.dart';
import 'detail_bill.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'statistical_page.dart';
import '../resources/app_color.dart';
import '../components/custom_text_field.dart';
import '../components/custom_button.dart';
import '../components/customer_item.dart';
import '../services/local/shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final SharedPrefs _sharedPrefs = SharedPrefs();
  final SharedPrefsSplash _sharedPrefsSplash = SharedPrefsSplash();
  List<Splash> _isLogedList = [];
  List<Customer> listCustomer = [];
  bool isVIP = false;
  int currentIndex = 0;
  double total = 0;
  @override
  void initState() {
    super.initState();
    _getCustomer();
  }

  _getCustomer() {
    _sharedPrefs.getCustomers().then((value) {
      setState(() {
        listCustomer = value ?? customerInitList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Hóa đơn',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.brown.shade800, Colors.brown.shade400],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TextFieldCustom(
                      controller: nameController,
                      hintText: 'Tên khách hàng',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFieldCustom(
                            controller: numberController,
                            hintText: 'Số lượng',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          flex: 1,
                          child: TextFieldCustom(
                            controller: priceController,
                            hintText: 'Giá',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isVIP = !isVIP;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                isVIP
                                    ? Icons.check_box_outlined
                                    : Icons.check_box_outline_blank,
                                size: 16.8,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Khách hàng VIP (discount 10%)",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              total = isVIP
                                  ? (double.parse(
                                          priceController.text.trim())) *
                                      int.parse(numberController.text.trim()) *
                                      0.9
                                  : double.parse(priceController.text.trim()) *
                                      int.parse(numberController.text.trim());
                              setState(() {});
                            },
                            child: const Text(
                              "Thành tiền",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 3,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            total.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonCustom(
                          onPress: () {
                            listCustomer.add(
                              Customer(
                                name: nameController.text,
                                quantity:
                                    int.parse(numberController.text.trim()),
                                price:
                                    double.parse(priceController.text.trim()),
                                total: isVIP
                                    ? (double.parse(
                                            priceController.text.trim())) *
                                        int.parse(
                                            numberController.text.trim()) *
                                        0.9
                                    : double.parse(
                                            priceController.text.trim()) *
                                        int.parse(numberController.text.trim()),
                                isVIP: isVIP,
                              ),
                            );
                            _sharedPrefs.addCustomers(listCustomer);
                            setState(() {
                              nameController.clear();
                              numberController.clear();
                              priceController.clear();
                              isVIP = false;
                            });
                          },
                          text: "Lưu thông tin",
                          backgroundColor: AppColor.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.white,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonCustom(
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StatisticalPage(
                                      listCustomer: listCustomer,
                                    ),
                                  ),
                                );
                              },
                              text: "Thống kê",
                              backgroundColor: AppColor.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            ListView.builder(
                              itemCount: listCustomer.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                int indexTemp = listCustomer.length - 1 - index;
                                return CustomerItem(
                                  ontap: () async {
                                    bool? isRemove = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (
                                          context,
                                        ) =>
                                            DetailBillPage(
                                          customer: listCustomer[indexTemp],
                                          index: indexTemp,
                                        ),
                                      ),
                                    );
                                    if (isRemove ?? false) {
                                      listCustomer.removeAt(indexTemp);
                                      _sharedPrefs.addCustomers(listCustomer);
                                      setState(() {});
                                    }
                                  },
                                  name: listCustomer[indexTemp].name,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
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
          onTap: (int indexOfItem) async {
            if (indexOfItem == 0) {
              // Navigate to the Home screen
            } else if (indexOfItem == 1) {
              bool? isRemoved = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchPage(listCustomer: listCustomer)),
              );
              if (isRemoved ?? true) {
                setState(() {
                  _getCustomer();
                });
              }
            } else {
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
              ).then(
                (status) {
                  if (status == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                    _isLogedList = [Splash(loged: false)];
                    _sharedPrefsSplash.updateLoged(_isLogedList);
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
