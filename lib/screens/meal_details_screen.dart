import 'package:delivery_app/screens/map_screen.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({Key? key});

  //TODO:CAPITALIZE FIRST WORD FOR AKARA MEAL NAME

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int quantity = 1;
  int checkoutPrice = 1;

  Widget addWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget addHeight({required double height}) {
    return SizedBox(
      height: height,
    );
  }

  void moveTo(Function() screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = (MediaQuery.of(context).size.height) / 1.7;

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
                            "https://res.cloudinary.com/eralphcloud/image/upload/v1705306732/routelift-list/n2y94lqrjnscu1vslcif.png",
                            fit: BoxFit
                                .contain, // Use BoxFit.cover for the image
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
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
                              Container(
                                width: 42,
                                height: 42,
                                child: Image.asset(
                                    "assets/images/icons8-furnitureandhousehold-64.png"),
                              ),
                              addWidth(5),
                              const Text(
                                "30 min",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w900),
                              ),
                              Container(
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
                              addWidth(5),
                              Container(
                                width: 45,
                                height: 45,
                                child: Image.asset(
                                    "assets/images/icons8-star-96.png"),
                              ),
                              addWidth(5),
                              const Text(
                                '4.9',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 170,
                          width: 400,
                          child: const Padding(
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
                              onTap: () => moveTo(() => const MapScreen()),
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
