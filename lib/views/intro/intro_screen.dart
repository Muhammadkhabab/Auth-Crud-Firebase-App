import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> assetPaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(248, 44, 1, 1),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color.fromARGB(248, 44, 1, 1),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: assetPaths.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      height: double.infinity,
                      width: double.infinity,
                      assetPaths[index],
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 141, 51, 51).withOpacity(0.2),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 200,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      foregroundImage: AssetImage('assets/images/logo1.png'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Customers Sample",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 48,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.white, width: 2),
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          "START NOW",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildDots(),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          assetPaths.length,
          (index) => AnimatedContainer(
            width: 18.0,
            height: 6.0,
            duration: const Duration(microseconds: 600),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(1),
              ),
              color: _currentPage == index ? const Color.fromARGB(255, 87, 21, 21) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
