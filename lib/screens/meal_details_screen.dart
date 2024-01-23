import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/meal_item.dart';
import 'package:delivery_app/screens/map_screen.dart';
import 'package:delivery_app/screens/widgets/meal_details_body.dart';
import 'package:delivery_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({super.key, required this.mealItem});

  final MealItem mealItem;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  late double mealPrice;
  late double checkoutPrice;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    mealPrice = widget.mealItem.mealPrice;
    checkoutPrice = mealPrice;
  }

  void checkout(String name, double price, int quantitys) {
    ref.watch(userProvider).checkout(name, price, quantitys);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        checkoutPrice = mealPrice;
        quantity = 1;
      });
    });
  }

  void updateCheckoutPrice(String operation) {
    if (operation == "add") {
      setState(() {
        checkoutPrice = mealPrice * quantity;
      });
    } else if (operation == "subtract" && checkoutPrice > 1) {
      setState(() {
        checkoutPrice -= mealPrice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = (MediaQuery.of(context).size.height) / 1.5;

    return Scaffold(
      backgroundColor: const Color(0xFF2C2C34),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 75, 73, 73),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/icons8-love-96.png",
                          fit: BoxFit.contain,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: screenWidth,
                  height: screenHeight,
                ),
                Positioned(
                  top: 10,
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          widget.mealItem.image,
                          fit: BoxFit.contain, //
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                                child: Text(
                              "No Network",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ));
                          },
                        ),
                      ),
                      addHeight(height: 20),
                      MealDetailsWidget(mealItem: widget.mealItem),
                      addHeight(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 233, 231, 231),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity = quantity - 1;
                                        updateCheckoutPrice("subtract");
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                Text(
                                  "$quantity",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = quantity + 1;
                                      updateCheckoutPrice("add");
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                checkout(
                                    widget.mealItem.mealName,
                                    double.parse(
                                        checkoutPrice.toStringAsFixed(2)),
                                    quantity);
                                moveTo(() => MapScreen(), context);
                              },
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AutoSizeText(
                                      'Checkout \$${checkoutPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines:
                                          1, // Ensure text stays within a single line
                                      overflow: TextOverflow
                                          .ellipsis, // Handle overflow with ellipsis
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
