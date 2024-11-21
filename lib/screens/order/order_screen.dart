import 'package:flutter/material.dart';
import 'package:foodmarket/screens/order/order_model.dart';

import '../home/home_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(
              title: "Your Orders",
              subtitle: "Wait for the best meal",
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => currentIndex = 0),
                          child: Text(
                            "In Progress",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex == 0
                                  ? Colors.black
                                  : const Color(0xFF8D92A3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                          onTap: () => setState(() => currentIndex = 1),
                          child: Text(
                            "Past Order",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex == 1
                                  ? Colors.black
                                  : const Color(0xFF8D92A3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: List.generate(
                        orders
                            .where((e) =>
                                e.status ==
                                (currentIndex == 0
                                    ? 'inProgress'
                                    : 'pastOrder'))
                            .map((e) => e)
                            .toList()
                            .length,
                        (i) => OrderWidget(
                          orderModel: orders
                              .where((e) =>
                                  e.status ==
                                  (currentIndex == 0
                                      ? 'inProgress'
                                      : 'pastOrder'))
                              .map((e) => e)
                              .toList()[i],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  final OrderModel orderModel;

  const OrderWidget({
    required this.orderModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(orderModel.foodModel.image),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderModel.foodModel.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${orderModel.qty} pcs - ${orderModel.foodModel.price}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  )
                ],
              )
            ],
          ),
          // Text('${DateTime(orderModel.dateTime as int).month}')
        ],
      ),
    );
  }
}
