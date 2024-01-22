import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/widgets/caller_widget.dart';
import 'package:delivery_app/screens/widgets/map_view.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          // Your app bar or other widgets here
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // MapWidgets is the class from the first part
                const MapWidgets(),
                Positioned(
                  top: 70, // Adjusted to be at the top
                  right: 300,
                  left: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 206, 204, 204),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  width: 380,
                  height: 300,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 380,
                    height: 300,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 30, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 219, 213, 213),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.timelapse,
                                    size: 30,
                                  ),
                                ),
                              ),
                              addWidth(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "10-15 min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                  addHeight(height: 10),
                                  const Text("Delivery Time"),
                                ],
                              )
                            ],
                          ),
                          addHeight(height: 25),
                          Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 219, 213, 213),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 30,
                                  ),
                                ),
                              ),
                              addWidth(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "70 Washington Square",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                    ),
                                  ),
                                  addHeight(height: 5),
                                  const Text("Delivery Address"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Positioned(
                  bottom: 30,
                  left: 24,
                  right: 24,
                  child: CallerWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
