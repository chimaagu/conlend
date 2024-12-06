import 'package:colend/login.dart';
import 'package:flutter/material.dart';

import '../route.dart';
import 'constant_onboarding.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final List<Color> pageColors = [
    const Color(0xff3EE8C4),
    const Color(0xff827BE6),
    const Color(0xff51CCE0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColors[currentIndex],
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Smooth transition effect
        color: pageColors[currentIndex], // Change color based on currentIndex
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                // Positioned PageView to move it a little higher
                Positioned(
                  top: 20,  // Adjust this value to control how high the image comes up
                  child: SizedBox(
                    width: constraints.maxWidth, // Set width explicitly for PageView
                    height: constraints.maxHeight * 0.6, // Set height to 60% of available space
                    child: PageView(
                      onPageChanged: (int page) {
                        setState(() {
                          currentIndex = page;
                        });
                      },
                      controller: _pageController,
                      children: [
                        createPage(image: 'assets/images/Onboard1.gif'),
                        createPage(image: 'assets/images/Onboard2.gif'),
                        createPage(image: 'assets/images/Onboard3.gif'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: constraints.maxWidth, // Ensure width is full screen
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Constants.getTitle(currentIndex),
                            style: const TextStyle(
                              color: Color(0xff01060D),
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            Constants.getDescription(currentIndex),
                            style: const TextStyle(
                              color: Color(0xff01060D),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          if (currentIndex == 2) // Correct comparison

                            GestureDetector(
                              onTap: () {
                                nextPageOnly(context, page: const LoginScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff0467DE),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  child: const Center(
                                    child: Text(
                                      "Start here",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: const EdgeInsets.all(2),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // Circular progress indicator
                                          SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: CircularProgressIndicator(
                                              value: (currentIndex + 1) / 3,
                                              color: const Color(0xff0467DE),
                                              backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                              strokeWidth: 3,
                                            ),
                                          ),
                                          // The main button container
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff0467DE),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (currentIndex < 2) {
                                                    currentIndex++;
                                                    _pageController.nextPage(
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.easeIn,
                                                    );
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_forward,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Define createPage widget
  Widget createPage({required String image}) {
    return Center(
      child: Image.asset(image),
    );
  }
}

class createPage extends StatelessWidget {
  final String image;

  const createPage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 300, right: 30, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
