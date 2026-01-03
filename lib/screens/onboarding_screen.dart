import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Welcome to Guardian Angel",
      "description":
          "Your safety companion in times of need. Connect with trusted contacts and alert them instantly.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Instant SOS Alerts",
      "description":
          "Activate the SOS button to send your live location and a pre-defined message to your emergency contacts.",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Community Support",
      "description":
          "Join support groups and connect with others who have been through similar experiences.",
    },
    {
      "image": "assets/images/onboarding4.png",
      "title": "Safety Status Updates",
      "description":
          "Let your loved ones know you're safe with a single tap. Mark yourself safe during emergencies.",
    },
    {
      "image": "assets/images/onboarding5.png",
      "title": "Direct & Group Messaging",
      "description":
          "Stay connected with your trusted contacts through secure direct and group messaging.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _onboardingData[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _onboardingData.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: theme.colorScheme.secondary,
                      dotColor: theme.colorScheme.secondary.withOpacity(0.3),
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 8,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingData.length - 1) {
                        // Use go_router for navigation
                        context.go('/welcome');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: const TextStyle(fontSize: 18),
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
}

class OnboardingPage extends StatelessWidget {
  final Map<String, String> data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data["image"]!,
            height: 300,
            // Add a placeholder for faulty images
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.broken_image,
                size: 300,
                color: Colors.grey,
              );
            },
          ),
          const SizedBox(height: 40),
          Text(
            data["title"]!,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          Text(
            data["description"]!,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
