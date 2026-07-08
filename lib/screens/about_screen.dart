import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../theme/app_theme.dart';
import '../widgets/dashboard_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: AppTheme.heroGradient,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity( 0.3),
                        blurRadius: 32,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Iconsax.mobile,
                    size: 64,
                    color: Colors.white,
                  ),
                ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
                const SizedBox(height: 24),
                Text(
                  'Profile Dashboard',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: 8),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(color: Colors.white.withOpacity( 0.5)),
                ).animate().fadeIn(delay: 300.ms),
                const SizedBox(height: 32),
                Text(
                  'A beautiful Flutter application showcasing login, '
                  'session persistence, dashboards, and personal bio profiles '
                  'with smooth animations and modern UI design.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.6,
                    color: Colors.white.withOpacity( 0.7),
                  ),
                ).animate().fadeIn(delay: 400.ms),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    'Flutter', 'go_router', 'Provider', 'google_fonts',
                    'flutter_animate', 'cached_network_image', 'shimmer',
                  ].map((pkg) {
                    return Chip(
                      label: Text(pkg, style: const TextStyle(fontSize: 11)),
                      backgroundColor: Colors.white.withOpacity( 0.08),
                      side: BorderSide(color: Colors.white.withOpacity( 0.1)),
                      labelStyle: TextStyle(color: Colors.white.withOpacity( 0.7)),
                    );
                  }).toList(),
                ).animate().fadeIn(delay: 500.ms),
                const Spacer(flex: 2),
                Text(
                  'Built with Flutter 💙',
                  style: TextStyle(color: Colors.white.withOpacity( 0.4)),
                ).animate().fadeIn(delay: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
