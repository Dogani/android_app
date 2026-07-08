import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().username ?? 'User';

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, $username 👋',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ).animate().fadeIn().slideX(begin: -0.1, end: 0),
                              const SizedBox(height: 4),
                              Text(
                                'Your dashboard overview',
                                style: TextStyle(
                                  color: Colors.white.withOpacity( 0.6),
                                ),
                              ).animate().fadeIn(delay: 100.ms),
                            ],
                          ),
                          IconButton(
                            onPressed: () => context.push('/settings'),
                            icon: const Icon(Iconsax.setting_2),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity( 0.08),
                            ),
                          ).animate().fadeIn(delay: 200.ms),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _StatsRow(),
                      const SizedBox(height: 32),
                      Text(
                        'Quick Access',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                      ).animate().fadeIn(delay: 300.ms),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  delegate: SliverChildListDelegate([
                    DashboardCard(
                      title: 'Personal Bio',
                      subtitle: 'View your profile',
                      icon: Iconsax.user,
                      color: const Color(0xFF6366F1),
                      onTap: () => context.push('/bio'),
                      delay: 400.ms,
                    ),
                    DashboardCard(
                      title: 'Projects',
                      subtitle: '12 active projects',
                      icon: Iconsax.folder_2,
                      color: const Color(0xFF8B5CF6),
                      onTap: () => context.push('/projects'),
                      delay: 500.ms,
                    ),
                    DashboardCard(
                      title: 'Skills',
                      subtitle: 'Tech stack & tools',
                      icon: Iconsax.code,
                      color: const Color(0xFF06B6D4),
                      onTap: () => context.push('/skills'),
                      delay: 600.ms,
                    ),
                    DashboardCard(
                      title: 'Contact',
                      subtitle: 'Get in touch',
                      icon: Iconsax.message,
                      color: const Color(0xFF10B981),
                      onTap: () => context.push('/contact'),
                      delay: 700.ms,
                    ),
                    DashboardCard(
                      title: 'About',
                      subtitle: 'App information',
                      icon: Iconsax.info_circle,
                      color: const Color(0xFFF59E0B),
                      onTap: () => context.push('/about'),
                      delay: 800.ms,
                    ),
                    DashboardCard(
                      title: 'Settings',
                      subtitle: 'Preferences & logout',
                      icon: Iconsax.setting_2,
                      color: const Color(0xFFEF4444),
                      onTap: () => context.push('/settings'),
                      delay: 900.ms,
                    ),
                  ]),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/dashboard');
            case 1:
              context.push('/bio');
            case 2:
              context.push('/projects');
            case 3:
              context.push('/settings');
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Bio'),
          NavigationDestination(icon: Icon(Iconsax.folder_2), label: 'Projects'),
          NavigationDestination(icon: Icon(Iconsax.setting_2), label: 'Settings'),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Projects',
            value: '12',
            icon: Iconsax.folder_2,
            color: const Color(0xFF8B5CF6),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            label: 'Skills',
            value: '24',
            icon: Iconsax.code,
            color: const Color(0xFF06B6D4),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            label: 'Sessions',
            value: 'Active',
            icon: Iconsax.shield_tick,
            color: const Color(0xFF10B981),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0);
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity( 0.2), color.withOpacity( 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity( 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withOpacity( 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
