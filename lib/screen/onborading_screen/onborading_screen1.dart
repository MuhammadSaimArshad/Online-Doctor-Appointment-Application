import 'package:doc_bookr/screen/signup_login/signin_screen.dart';
import 'package:doc_bookr/screen/signup_login/signup_screen.dart';

import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  void moveToNextPage() {
    int nextPage = _pageController.page!.toInt() + 1;
    if (nextPage < _pages.length) {
      _pageController.animateToPage(
        nextPage,
        duration:
            const Duration(milliseconds: 300), // You can adjust the duration
        curve: Curves.ease, // You can choose a different curve if needed
      );
    }
  }

  final List<Widget> _pages = [
    const IntroPage(
      image: 'images/image (1).png',
      title: 'Find Trusted Doctor',
      description:
          'Find The Trust And Best Dcotor\n And Share With Friends,Relative.',
    ),
    const IntroPage(
      image: 'images/image (2).png',
      title: 'Choose Best Doctor',
      description: 'Choose The Best Doctor \n In Your Area.',
    ),
    const IntroPage(
      image: 'images/image (3).png',
      title: 'Easy Appointments',
      description:
          'Easy Appointments And Chat with Doctor \n Personal and Solve Confuseon.',
    ),
  ];

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _pages[index];
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ));
                    } else {
                      moveToNextPage();
                    }
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xff0EBE7F),
                    ),
                    child: Center(
                        child: Text(
                      _currentPage == 2 ? "SignUp" : "Next",
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninScreen(),
                          ));
                    } else {
                      moveToNextPage();
                    }
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: const Color(0xff0EBE7F),
                            width: width * 0.005)),
                    child: Center(
                        child: Text(
                      _currentPage == 2 ? "Login" : "Skip",
                      style: const TextStyle(color: Color(0xff0EBE7F)),
                    )),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        _currentPage == i ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 12.0,
      width: isActive ? 15.0 : 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xff0EBE7F) : Colors.grey,
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const IntroPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 200.0,
        ),
        const SizedBox(height: 20.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          description,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
