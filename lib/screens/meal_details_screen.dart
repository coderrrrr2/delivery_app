import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/map_screen.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int quantity = 1;
  int checkoutPrice = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = (MediaQuery.of(context).size.height) / 1.7;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 27, 27),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
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
                    top: 20,
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          height: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            imageUrl, // Assuming you have a mealImageURL property
                            fit: BoxFit
                                .contain, // Use BoxFit.cover for the image
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
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          width: screenWidth / 1.1,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "Chicken Curry with rice",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 42,
                                height: 42,
                                child: Image.asset(
                                    "assets/images/icons8-furnitureandhousehold-64.png"),
                              ),
                              addWidth(width: 5),
                              const Text(
                                "30 min",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                    "assets/images/icons8-flame-96 copy.png"),
                              ),
                              const Text(
                                "275 calories",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              addWidth(width: 5),
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: Image.asset(
                                    "assets/images/icons8-star-96.png"),
                              ),
                              addWidth(width: 5),
                              const Text(
                                '4.9',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 170,
                          width: 400,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Text(
                                "Indulge in the delightful experience of Product 1, a perfect blend of flavors and nutrition to satisfy your cravings. Created with care, this dish promises a memorable dining experience.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity = quantity - 1;
                                          updateCheckoutPrice();
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
                                        updateCheckoutPrice();
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
                              onTap: () => moveTo(() => MapScreen(), context),
                              child: Container(
                                width: 220,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    'Checkout \$$checkoutPrice',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }

  void updateCheckoutPrice() {
    checkoutPrice = 1 * quantity;
  }
}
