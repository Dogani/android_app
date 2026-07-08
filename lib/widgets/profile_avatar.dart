import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size = 120,
    this.showBorder = true,
  });

  final String imageUrl;
  final double size;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: showBorder
            ? const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF06B6D4)],
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity( 0.4),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: showBorder ? const EdgeInsets.all(3) : EdgeInsets.zero,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: Container(color: Colors.grey.shade800),
          ),
          errorWidget: (context, url, error) => Container(
            color: const Color(0xFF312E81),
            child: Icon(Icons.person, size: size * 0.5, color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
