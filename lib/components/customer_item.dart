import 'package:flutter/material.dart';
import '../resources/app_color.dart';

class CustomerItem extends StatelessWidget {
  const CustomerItem(
      {super.key, this.ontap, this.name, this.quantity, this.price});
  final String? name;
  final int? quantity;
  final double? price;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          const Divider(
            color: AppColor.white,
            thickness: 2.0,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Khách hàng: $name",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Click để xem chi tiết",
                        style: TextStyle(
                          color: AppColor.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.red,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
