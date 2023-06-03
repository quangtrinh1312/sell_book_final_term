import 'package:flutter/material.dart';
import 'package:sell_book_final_term/models/customer.dart';
import '../resources/app_color.dart';

class StatisticalPage extends StatefulWidget {
  const StatisticalPage({
    super.key,
    required this.listCustomer,
  });
  final List<Customer> listCustomer;
  @override
  State<StatisticalPage> createState() => _StatisticalPageState();
}

class _StatisticalPageState extends State<StatisticalPage> {
  int tongKhachHang = 0;
  int tongKhachHangVip = 0;
  double tongDoanhThu = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tinh tong so khach hang, tong doanh thu va dem so luong khach hang
    for (var i = 0; i < widget.listCustomer.length; i++) {
      tongKhachHang++;
      tongDoanhThu += widget.listCustomer[i].total?? 0 ;
      if (widget.listCustomer[i].isVIP ?? false) {
        tongKhachHangVip++;
      }
    }
     
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Thống kê',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown, // Thay đổi màu sắc của AppBar
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.brown.shade800, Colors.brown.shade400],
          ),
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
               Row(
                children: [
                  Text(
                    'Tổng số khách hàng: $tongKhachHang',
                    style: const TextStyle(fontSize: 20, color: AppColor.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'Tổng số khách hàng VIP: $tongKhachHangVip',
                    style: const TextStyle(fontSize: 20, color: AppColor.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'Tổng doanh thu: $tongDoanhThu',
                    style: const TextStyle(fontSize: 20, color: AppColor.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Quay lại ',
                style: TextStyle(color: Colors.brown[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
