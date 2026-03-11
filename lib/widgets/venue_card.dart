import 'package:flutter/material.dart';
import '../theme.dart';

class VenueCard extends StatelessWidget {
  final String imagePath;
  final String category;
  final String name;
  final VoidCallback? onTap;
  final double? height;

  const VenueCard({
    super.key,
    required this.imagePath,
    required this.category,
    required this.name,
    this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.cardBackground,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// Background image
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder:
                    (c, e, s) => Container(
                      color: AppColors.surface,
                      child: const Icon(
                        Icons.restaurant,
                        color: AppColors.gold,
                        size: 40,
                      ),
                    ),
              ),

              /// Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.2),
                      Colors.black.withValues(alpha: 0.75),
                    ],
                    stops: const [0.3, 0.6, 1.0],
                  ),
                ),
              ),

              /// Bottom content
              Positioned(
                left: 14,
                right: 14,
                bottom: 14,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// Text section (takes remaining width)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Category
                          Text(
                            category,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.3,
                            ),
                          ),

                          const SizedBox(height: 2),

                          /// Venue name
                          GradientTextProducts(name),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    /// Arrow button
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withValues(alpha: 0.5),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.creditsChip,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
