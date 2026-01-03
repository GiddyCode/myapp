import 'package:flutter/material.dart';
import 'package:myapp/screens/home_dashboard_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      title: 'BLOOM FREELY, ANYTIME, ANYWHERE.',
      description: 'Your journey, your safety, your power. Designed for South African women and children.',
      image: 'assets/images/onboarding1.png',
      features: [
        'Instant Emergency Response',
        'Vetted Safety Professionals',
        '24/7 Support Network',
      ],
    ),
    OnboardingPageData(
      title: 'Your Safety, Your Power!',
      description: 'Move with confidence, knowing help is always within reach.',
      image: 'assets/images/onboarding2.png',
      features: [
        'Real-time Location Sharing',
        'Community Safety Ratings',
        'Smart Risk Assessment',
      ],
    ),
    OnboardingPageData(
      title: 'Protecting Our Children',
      description: 'Every child deserves to feel safe and protected wherever they go.',
      image: 'assets/images/onboarding3.png',
      features: [
        'Child Safety Tracking',
        'Parent Alerts',
        'Family Protection Network',
      ],
    ),
        OnboardingPageData(
      title: 'United in Safety',
      description: 'A rainbow nation standing together to protect every woman and child.',
      image: 'assets/images/onboarding4.png',
      features: [
        'Community Support',
        'Diverse Safety Network',
        'Cultural Understanding',
      ],
    ),
    OnboardingPageData(
      title: 'Empowered & Protected',
      description: 'Navigate your day with confidence, knowing you\'re never alone.',
      image: 'assets/images/onboarding5.png',
      features: [
        '24/7 Support',
        'Professional Protection',
        'Peace of Mind',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(data: _pages[index]);
              },
            ),
          ),
          _buildNavigation(),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) => _buildDot(index: index)),
          ),
          const SizedBox(height: 20),
          if (_currentPage == _pages.length - 1)
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeDashboardScreen()),
                );
              },
              child: const Text('Get Started'),
            )
          else
            ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              child: const Text('Next'),
            ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeDashboardScreen()),
                );
            },
            child: const Text('Skip', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _currentPage == index ? Theme.of(context).colorScheme.secondary : Colors.white24,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingPageData {
  final String title;
  final String description;
  final String image;
  final List<String> features;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.image,
    required this.features,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 40),
          Image.asset(
            data.image,
            height: 300,
          ),
          const SizedBox(height: 40),
          ...data.features.map((feature) => _buildFeature(context, feature)),
        ],
      ),
    );
  }

  Widget _buildFeature(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}