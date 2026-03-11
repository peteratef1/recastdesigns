import 'package:flutter/material.dart';
import '../theme.dart';

class LoyaltyCard extends StatelessWidget {
  final int points;
  final int totalOrders;
  final double progressValue;
  final List<String> recentFoodImages;
  final VoidCallback? onMoreDetails;

  const LoyaltyCard({
    super.key,
    required this.points,
    required this.totalOrders,
    this.progressValue = 0.62,
    required this.recentFoodImages,
    this.onMoreDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AlterNow',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Loyalty Points',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 1.5),
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: AppColors.white,
                  size: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Points number
          GradientText(
            _formatPoints(points),
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1,
            ),
          ),

          const SizedBox(height: 14),

          Container(
            height: 25,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  /// Black background track
                  Container(color: AppColors.background),

                  /// Gold progress
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progressValue,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient: LinearGradient(
                          colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Total Orders row
          Container(
            padding: const EdgeInsets.fromLTRB(5, 6, 12, 3),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Orders',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  totalOrders.toString(),
                  style: const TextStyle(
                    color: AppColors.creditsChip,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:
                    recentFoodImages.take(3).map((img) {
                      return Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: 44,
                        height: 44,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.asset(
                            img,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (c, e, s) => Container(
                                  color: AppColors.surface,
                                  child: Icon(
                                    Icons.restaurant,
                                    color: AppColors.gold,
                                    size: 20,
                                  ),
                                ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
              GestureDetector(
                onTap: onMoreDetails,
                child: Container(
                  width: 100,
                  height: 27,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white, width: 1),
                    borderRadius: BorderRadius.circular(13.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'More details',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10.5,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 9,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatPoints(int pts) {
    if (pts >= 1000) {
      final s = pts.toString();
      final int len = s.length;
      final int commaPos = len - 3;
      return '${s.substring(0, commaPos)},${s.substring(commaPos)}';
    }
    return pts.toString();
  }
}
