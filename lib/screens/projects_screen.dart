import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/dashboard_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  static const _projects = [
    _Project(
      name: 'E-Commerce App',
      description: 'Flutter mobile app with payment integration',
      tech: 'Flutter • Firebase • Stripe',
      progress: 0.85,
      color: Color(0xFF6366F1),
    ),
    _Project(
      name: 'Task Manager',
      description: 'Collaborative project management tool',
      tech: 'React • Node.js • MongoDB',
      progress: 0.65,
      color: Color(0xFF8B5CF6),
    ),
    _Project(
      name: 'Weather Dashboard',
      description: 'Real-time weather with beautiful animations',
      tech: 'Flutter • OpenWeather API',
      progress: 1.0,
      color: Color(0xFF06B6D4),
    ),
    _Project(
      name: 'Portfolio Website',
      description: 'Personal portfolio with blog integration',
      tech: 'Next.js • Tailwind CSS',
      progress: 0.45,
      color: Color(0xFF10B981),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
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
          child: ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              final project = _projects[index];
              return _ProjectCard(project: project, index: index);
            },
          ),
        ),
      ),
    );
  }
}

class _Project {
  const _Project({
    required this.name,
    required this.description,
    required this.tech,
    required this.progress,
    required this.color,
  });

  final String name;
  final String description;
  final String tech;
  final double progress;
  final Color color;
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.index});

  final _Project project;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            project.color.withOpacity( 0.2),
            project.color.withOpacity( 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: project.color.withOpacity( 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: project.color.withOpacity( 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Iconsax.folder_2, color: project.color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  project.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${(project.progress * 100).toInt()}%',
                style: TextStyle(
                  color: project.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project.description,
            style: TextStyle(color: Colors.white.withOpacity( 0.7)),
          ),
          const SizedBox(height: 8),
          Text(
            project.tech,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity( 0.5),
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: project.progress,
              backgroundColor: Colors.white.withOpacity( 0.1),
              color: project.color,
              minHeight: 6,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (index * 100).ms)
        .slideX(begin: 0.1, end: 0, duration: 400.ms, delay: (index * 100).ms);
  }
}
