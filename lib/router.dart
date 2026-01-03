import 'package:go_router/go_router.dart';
import 'package:myapp/screens/about_legal_screen.dart';
import 'package:myapp/screens/active_sos_screen.dart';
import 'package:myapp/screens/community_feed_screen.dart';
import 'package:myapp/screens/create_post_screen.dart';
import 'package:myapp/screens/create_profile_screen.dart';
import 'package:myapp/screens/direct_messaging_screen.dart';
import 'package:myapp/screens/emergency_contacts_screen.dart';
import 'package:myapp/screens/emergency_settings_screen.dart';
import 'package:myapp/screens/group_chat_screen.dart';
import 'package:myapp/screens/help_faq_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/notifications_screen.dart';
import 'package:myapp/screens/onboarding_screen.dart';
import 'package:myapp/screens/otp_verification_screen.dart';
import 'package:myapp/screens/phone_number_entry_screen.dart';
import 'package:myapp/screens/privacy_security_screen.dart';
import 'package:myapp/screens/safety_status_screen.dart';
import 'package:myapp/screens/settings_screen.dart';
import 'package:myapp/screens/sos_activation_screen.dart';
import 'package:myapp/screens/sos_history_screen.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:myapp/screens/support_groups_screen.dart';
import 'package:myapp/screens/trusted_contacts_screen.dart';
import 'package:myapp/screens/user_profile_screen.dart';
import 'package:myapp/screens/welcome_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/phone',
      builder: (context, state) => const PhoneNumberEntryScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpVerificationScreen(),
    ),
    GoRoute(
      path: '/create-profile',
      builder: (context, state) => const CreateProfileScreen(),
    ),
    GoRoute(
      path: '/emergency-contacts',
      builder: (context, state) => const EmergencyContactsScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/sos',
      builder: (context, state) => const SosActivationScreen(),
    ),
    GoRoute(
      path: '/active-sos',
      builder: (context, state) => const ActiveSosScreen(),
    ),
    GoRoute(
      path: '/sos-history',
      builder: (context, state) => const SosHistoryScreen(),
    ),
    GoRoute(
      path: '/trusted-contacts',
      builder: (context, state) => const TrustedContactsScreen(),
    ),
    GoRoute(
      path: '/safety-status',
      builder: (context, state) => const SafetyStatusScreen(),
    ),
    GoRoute(
      path: '/emergency-settings',
      builder: (context, state) => const EmergencySettingsScreen(),
    ),
    GoRoute(
      path: '/community',
      builder: (context, state) => const CommunityFeedScreen(),
    ),
    GoRoute(
      path: '/create-post',
      builder: (context, state) => const CreatePostScreen(),
    ),
    GoRoute(
      path: '/support-groups',
      builder: (context, state) => const SupportGroupsScreen(),
    ),
    GoRoute(
      path: '/group-chat',
      builder: (context, state) => const GroupChatScreen(),
    ),
    GoRoute(
      path: '/direct-messaging',
      builder: (context, state) => const DirectMessagingScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const UserProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/privacy-security',
      builder: (context, state) => const PrivacySecurityScreen(),
    ),
    GoRoute(path: '/help', builder: (context, state) => const HelpFaqScreen()),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutLegalScreen(),
    ),
  ],
);
