import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/dashboard_card.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  static const _skills = [
    _Skill(name: 'Flutter', level: 0.95, color: Color(0xFF54C5F8)),
    _Skill(name: 'Dart', level: 0.90, color: Color(0xFF00B4AB)),
    _Skill(name: 'React', level: 0.85, color: Color(0xFF61DAFB)),
    _Skill(name: 'TypeScript', level: 0.80, color: Color(0xFF3178C6)),
    _Skill(name: 'Node.js', level: 0.75, color: Color(0xFF68A063)),
    _Skill(name: 'Firebase', level: 0.85, color: Color(0xFFFFCA28)),
    _Skill(name: 'Git', level: 0.90, color: Color(0xFFF05032)),
    _Skill(name: 'UI/UX Design', level: 0.70, color: Color(0xFF8B5CF6)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
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
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'Tech Stack',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ).animate().fadeIn(),
              const SizedBox(height: 8),
              Text(
                'Technologies I work with daily',
                style: TextStyle(color: Colors.white.withOpacity( 0.6)),
              ).animate().fadeIn(delay: 100.ms),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  'Flutter', 'Dart', 'React', 'Node.js', 'Firebase',
                  'AWS', 'Docker', 'Figma', 'GraphQL', 'PostgreSQL',
                ].asMap().entries.map((entry) {
                  return Chip(
                    label: Text(entry.value),
                    backgroundColor: const Color(0xFF6366F1).withOpacity( 0.2),
                    side: BorderSide(
                      color: const Color(0xFF6366F1).withOpacity( 0.3),
                    ),
                    labelStyle: const TextStyle(color: Colors.white),
                  )
                      .animate()
                      .fadeIn(delay: (entry.key * 50).ms)
                      .scale(begin: const Offset(0.8, 0.8));
                }).toList(),
              ),
              const SizedBox(height: 32),
              Text(
                'Proficiency',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
              ).animate().fadeIn(delay: 300.ms),
              const SizedBox(height: 16),
              ..._skills.asMap().entries.map((entry) {
                return _SkillBar(skill: entry.value, index: entry.key);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _Skill {
  const _Skill({
    required this.name,
    required this.level,
    required this.color,
  });

  final String name;
  final double level;
  final Color color;
}

class _SkillBar extends StatelessWidget {
  const _SkillBar({required this.skill, required this.index});

  final _Skill skill;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                '${(skill.level * 100).toInt()}%',
                style: TextStyle(color: skill.color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: skill.level),
              duration: Duration(milliseconds: 800 + index * 100),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.white.withOpacity( 0.1),
                  color: skill.color,
                  minHeight: 8,
                );
              },
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (400 + index * 80).ms).slideX(begin: 0.05, end: 0);
  }
}
