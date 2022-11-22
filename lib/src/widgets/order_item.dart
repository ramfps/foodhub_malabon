import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('\₱${order.amount}'),
          subtitle: Text(
            DateFormat('MMM dd, yyyy hh:mm').format(order.dateTime),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.expand_more),
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
