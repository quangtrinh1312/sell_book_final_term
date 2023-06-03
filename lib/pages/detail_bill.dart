import 'package:flutter/material.dart';
import '../resources/app_color.dart';
import '../models/customer.dart';
import '../services/local/shared_prefs.dart';

class DetailBillPage extends StatefulWidget {
  const DetailBillPage({super.key, this.customer, this.index});
  final int? index;
  final Customer? customer;

  @override
  State<DetailBillPage> createState() => _DetailBillPageState();
}

class _DetailBillPageState extends State<DetailBillPage> {
  final SharedPrefs _sharedPrefs = SharedPrefs();
  List<Customer>? listCustomer = [];
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Thông tin hóa đơn',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      backgroundColor: Colors.brown.shade400,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.brown.shade800, Colors.brown.shade400],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Row(
                      children: [
                        Text(
                          'Khách hàng : ${widget.customer!.name}',
                          style: const TextStyle(
                              color: AppColor.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "VIP: ",
                            style:
                                TextStyle(color: AppColor.white, fontSize: 20),
                          ),
                          () {
                            if (widget.customer!.isVIP == true) {
                              return const Icon(Icons.star_sharp,
                                  color: AppColor.red);
                            } else {
                              return const Icon(Icons.star_border_sharp,
                                  color: AppColor.red);
                            }
                          }()
                        ],
                      ),
                      Text(
                        "Quantity : ${widget.customer!.quantity}",
                        style: const TextStyle(
                            color: AppColor.white, fontSize: 20),
                      ),
                      Text(
                        "Price : ${widget.customer!.price}",
                        style: const TextStyle(
                            color: AppColor.white, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Price : ${widget.customer!.total}",
                        style: const TextStyle(
                            color: AppColor.white, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text(
                'Quay lại ',
                style: TextStyle(color: AppColor.black),
              ),
            ),
            InkWell(
              onTap: (){
                listCustomer!.removeAt(widget.index!);
                _sharedPrefs.addCustomers(listCustomer!);
                Navigator.pop(context, true);
              },
              child: const Text(
                'Xóa hóa đơn',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
