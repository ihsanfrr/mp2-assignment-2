import 'package:flutter/material.dart';
import './food_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: const HeaderWidget(
                title: "FoodMarket",
                subtitle: "Let's get some foods",
                isHome: true,
              ),
            ),
            const SizedBox(height: 24),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(24),
                color: Colors.white,
                // height: MediaQuery.of(context).size.height * 0.6,
                child: ListView(
                  children: List.generate(
                    foods.length,
                    (i) => FoodWidget(
                      foodModel: foods[i],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodWidget extends StatelessWidget {
  final FoodModel foodModel;

  const FoodWidget({
    required this.foodModel,
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
                    image: AssetImage(foodModel.image),
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
                    foodModel.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    foodModel.price,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  )
                ],
              )
            ],
          ),
          Stack(
            children: [
              Row(
                children: List.generate(
                  5,
                  (i) => const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  foodModel.rating.toInt(),
                  (i) => const Icon(
                    Icons.star,
                    color: Color(0xFFFFC700),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? isHome;

  const HeaderWidget({
    required this.title,
    required this.subtitle,
    this.isHome,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          isHome != null
              ? Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/profile.png'),
                        fit: BoxFit.cover,
                      )),
                )
              : Container(),
        ],
      ),
    );
  }
}
