import 'package:flutter/material.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({Key? key});

  //TODO:CAPITALIZE FIRST WORD FOR AKARA MEAL NAME

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  int quantity = 1;

  int checkoutPrice = 1;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = (MediaQuery.of(context).size.height) / 1.7;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  InkWell(
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
                    child: const Icon(
                      Icons.hearing_outlined,
                      color: Colors.red,
                    ),
                  ),
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
                          width: 380,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "assets/images/bitmoji_png.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: screenWidth / 1.2,
                          child: const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Fish dfef df d fd d f df d d f ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.alarm),
                            Text("30 min"),
                            Icon(Icons.fire_extinguisher),
                            Text("275 calories"),
                            Icon(Icons.star),
                            Text('4.9')
                          ],
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: const SingleChildScrollView(
                            child: Text(
                              """ dffdffd
                            dffdffdf
                            dfdfdfdfdf
                            dfdfdffdf
                            dfdfdfd
                            d
                            d
                            d
                            d
                            d
                            d
                            d
                            """,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                                        if (quantity > 0) {
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
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                // Handle checkout button tap
                              },
                              child: Container(
                                width: 200,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    'Checkout  $checkoutPrice',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
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
