import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildSOSButton(context),
                const SizedBox(height: 16),
                Text(
                  'Press and hold for 3 seconds to alert SAPS (10111) and your trusted contacts',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 24),
                _buildGridView(context),
                const SizedBox(height: 24),
                _buildQuickUpdateCard(context),
                const SizedBox(height: 24),
                _buildInfoCards(context),
                const SizedBox(height: 24),
                _buildDeviceCards(context),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Assuming some header content might go here
        SizedBox(width: 48), // Placeholder for alignment
      ],
    );
  }

  Widget _buildSOSButton(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        context.go('/sos_activation');
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.white, size: 60),
            SizedBox(height: 8),
            Text(
              'SOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': LucideIcons.shieldAlert,
        'title': 'SOS History',
        'subtitle': 'View past alerts',
        'route': '/sos_history',
      },
      {
        'icon': LucideIcons.users,
        'title': 'Community',
        'subtitle': 'Connect with others',
        'route': '/community_feed',
      },
      {
        'icon': LucideIcons.userCheck,
        'title': 'Safety Status',
        'subtitle': 'Update your status',
        'route': '/safety_status',
      },
      {
        'icon': LucideIcons.contact,
        'title': 'Trusted Contacts',
        'subtitle': 'Manage your contacts',
        'route': '/trusted_contacts',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildGridItem(
          context: context,
          icon: item['icon'],
          title: item['title'],
          subtitle: item['subtitle'],
          onTap: () => context.go(item['route']),
        );
      },
    );
  }

  Widget _buildGridItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isPro = false,
  }) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 36, color: theme.colorScheme.secondary),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                ),
              ],
            ),
            if (isPro)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'PRO',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickUpdateCard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Update', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/safety_status'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Voice or Text Check-in'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildGhostWalkCard(context)),
        const SizedBox(width: 16),
        Expanded(child: _buildRiskScoreCard(context)),
      ],
    );
  }

  Widget _buildGhostWalkCard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ghost Walk',
            style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Stay safe while walking with trusted contacts watching',
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
          const Spacer(),
          // Placeholder for avatars
          Row(
            children: [
              _buildAvatar(Colors.blue),
              _buildAvatar(Colors.green),
              _buildAvatar(Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRiskScoreCard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.trendingUp,
                size: 16,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Text(
                'Risk Score',
                style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '18',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'LOW',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDeviceCard(context, 'Wristband', LucideIcons.watch),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildDeviceCard(context, 'Earpiece', LucideIcons.ear)),
      ],
    );
  }

  Widget _buildDeviceCard(BuildContext context, String name, IconData icon) {
    final theme = Theme.of(context);
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Not connected',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.add, color: theme.colorScheme.secondary),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color color) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 12,
      // In a real app, you would use an ImageProvider
    );
  }
}
