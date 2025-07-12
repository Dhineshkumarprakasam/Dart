import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  // Create a PageController to control the PageView
  final PageController _pageController = PageController(initialPage: 0);

  // Define the pages of the app intro as a list of maps
  final List<Map<String, dynamic>> _pages = [
    {
      'image': Image.asset('assets/images/on_boarding_images/img1.png'),
      'title': 'Welcome to RePlate',
      'description': 'Turn excess food into someone’s hope',
    },
    {
      'image': Image.asset('assets/images/on_boarding_images/img2.png'),
      'title': 'Wasted or Needed?',
      'description': 'Tons of food are wasted \nwhile millions stay hungry.',
    },
    {
      'image': Image.asset('assets/images/on_boarding_images/img3.png'),
      'title': 'Snap. Share. Support',
      'description': 'Post food. Get requests. \nMake someone’s day.',
    },
    {
      'image': Image.asset('assets/images/on_boarding_images/img4.png'),
      'title': 'Your Safety Matters',
      'description': 'Verified users. Private chats. \nReport & review system.',
    },
    {
      'image': Image.asset('assets/images/on_boarding_images/img5.png'),
      'title': 'Be the Change',
      'description': 'Donate, receive, or join an NGO \nit starts with you.',
    },
  ];

  // Track the index of the current page
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: _pages[index]['image'],
                    ),

                    const SizedBox(height: 32.0),
                    Text(
                      _pages[index]['title'],
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        _pages[index]['description'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                );
              },
            ),

            // Add circles to indicate the current page
            Positioned(
              bottom: 32.0,
              left: 16.0,
              child: Row(
                children: [
                  for (int i = 0; i < _pages.length; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _currentPageIndex
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade300,
                      ),
                    ),
                ],
              ),
            ),

            // Add a button to move to the next page or get started
            Positioned(
              bottom: 32.0,
              right: 16.0,
              child: _currentPageIndex == _pages.length - 1
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      onPressed: () {},
                      child: const Text('Get Started'),
                    )
                  : IconButton(
                      onPressed: () {
                        // Move to the next page when the arrow button is tapped
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
