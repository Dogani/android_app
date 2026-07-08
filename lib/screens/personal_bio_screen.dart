import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/dashboard_card.dart';
import '../widgets/profile_avatar.dart';

class PersonalBioScreen extends StatelessWidget {
  const PersonalBioScreen({super.key});

  static const _avatarUrl =
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop';

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 280,
              pinned: true,
              backgroundColor: const Color(0xFF1E1B4B),
              leading: IconButton(
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () => context.pop(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF1E1B4B)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const ProfileAvatar(imageUrl: _avatarUrl, size: 110)
                          .animate()
                          .scale(duration: 500.ms, curve: Curves.elasticOut),
                      const SizedBox(height: 16),
                      const Text(
                        'Alex Morgan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ).animate().fadeIn(delay: 200.ms),
                      const SizedBox(height: 4),
                      Text(
                        'Full Stack Developer',
                        style: TextStyle(
                          color: Colors.white.withOpacity( 0.7),
                          fontSize: 14,
                        ),
                      ).animate().fadeIn(delay: 300.ms),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ).animate().fadeIn(delay: 350.ms),
                    const SizedBox(height: 12),
                    Text(
                      'Passionate software developer with 5+ years of experience '
                      'building beautiful mobile and web applications. I love creating '
                      'intuitive user experiences and solving complex problems with '
                      'clean, maintainable code. When I\'m not coding, you\'ll find me '
                      'exploring new technologies or contributing to open source.',
                      style: TextStyle(
                        height: 1.6,
                        color: Colors.white.withOpacity( 0.75),
                        fontSize: 15,
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 32),
                    Text(
                      'Quick Links',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ).animate().fadeIn(delay: 450.ms),
                    const SizedBox(height: 16),
                    BioLinkButton(
                      label: 'View My Projects',
                      icon: Iconsax.folder_2,
                      onTap: () => context.push('/projects'),
                      delay: 500.ms,
                    ),
                    const SizedBox(height: 12),
                    BioLinkButton(
                      label: 'Skills & Technologies',
                      icon: Iconsax.code,
                      onTap: () => context.push('/skills'),
                      delay: 550.ms,
                    ),
                    const SizedBox(height: 12),
                    BioLinkButton(
                      label: 'Contact Me',
                      icon: Iconsax.message,
                      onTap: () => context.push('/contact'),
                      delay: 600.ms,
                    ),
                    const SizedBox(height: 12),
                    BioLinkButton(
                      label: 'GitHub Profile',
                      icon: Iconsax.code_1,
                      onTap: () => _launchUrl('https://github.com'),
                      delay: 650.ms,
                    ),
                    const SizedBox(height: 12),
                    BioLinkButton(
                      label: 'LinkedIn',
                      icon: Iconsax.link,
                      onTap: () => _launchUrl('https://linkedin.com'),
                      delay: 700.ms,
                    ),
                    const SizedBox(height: 12),
                    BioLinkButton(
                      label: 'Portfolio Website',
                      icon: Iconsax.global,
                      onTap: () => _launchUrl('https://flutter.dev'),
                      delay: 750.ms,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Location & Contact',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ).animate().fadeIn(delay: 800.ms),
                    const SizedBox(height: 16),
                    _InfoTile(
                      icon: Iconsax.location,
                      label: 'San Francisco, CA',
                      delay: 850.ms,
                    ),
                    _InfoTile(
                      icon: Iconsax.sms,
                      label: 'alex.morgan@email.com',
                      delay: 900.ms,
                    ),
                    _InfoTile(
                      icon: Iconsax.call,
                      label: '+1 (555) 123-4567',
                      delay: 950.ms,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.delay,
  });

  final IconData icon;
  final String label;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6366F1), size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(color: Colors.white.withOpacity( 0.7)),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay).slideX(begin: -0.05, end: 0);
  }
}
