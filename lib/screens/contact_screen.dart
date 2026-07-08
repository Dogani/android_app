import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/dashboard_card.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in Touch',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(),
                const SizedBox(height: 8),
                Text(
                  'Have a project in mind? Let\'s talk!',
                  style: TextStyle(color: Colors.white.withOpacity( 0.6)),
                ).animate().fadeIn(delay: 100.ms),
                const SizedBox(height: 32),
                _ContactCard(
                  icon: Iconsax.sms,
                  title: 'Email',
                  subtitle: 'alex.morgan@email.com',
                  color: const Color(0xFF6366F1),
                  delay: 200.ms,
                ),
                _ContactCard(
                  icon: Iconsax.call,
                  title: 'Phone',
                  subtitle: '+1 (555) 123-4567',
                  color: const Color(0xFF8B5CF6),
                  delay: 300.ms,
                ),
                _ContactCard(
                  icon: Iconsax.location,
                  title: 'Location',
                  subtitle: 'San Francisco, CA',
                  color: const Color(0xFF06B6D4),
                  delay: 400.ms,
                ),
                const SizedBox(height: 32),
                Text(
                  'Send a Message',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(delay: 500.ms),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(labelText: 'Your Name'),
                ).animate().fadeIn(delay: 550.ms),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(labelText: 'Your Email'),
                ).animate().fadeIn(delay: 600.ms),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(labelText: 'Message'),
                  maxLines: 4,
                ).animate().fadeIn(delay: 650.ms),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Message sent successfully!'),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Iconsax.send_1),
                    label: const Text('Send Message'),
                  ),
                ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.1, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.delay,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity( 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity( 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity( 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity( 0.5),
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay).slideX(begin: -0.05, end: 0);
  }
}
