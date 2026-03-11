import 'package:flutter/material.dart';
import '../theme.dart';

class HistoryCard extends StatelessWidget {
  final String imagePath;
  final String restaurantName;
  final String date;
  final String amount;
  final int creditsSpent;
  final int creditsEarned;
  final VoidCallback? onTap;

  const HistoryCard({
    super.key,
    required this.imagePath,
    required this.restaurantName,
    required this.date,
    required this.amount,
    required this.creditsSpent,
    required this.creditsEarned,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Food image
            Container(
              width: 53,
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.background,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  imagePath,
                  width: 34,
                  height: 30,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (c, e, s) => Center(
                        child: Icon(
                          Icons.restaurant,
                          color: AppColors.gold,
                          size: 24,
                        ),
                      ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            // Info column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    date,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$amount • $creditsSpent Credits',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      foreground:
                          Paint()
                            ..shader = const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
                            ).createShader(const Rect.fromLTWH(0, 0, 200, 20)),
                    ),
                  ),
                ],
              ),
            ),

            // Right side
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
                    ),
                  ),
                  child: Text(
                    '$creditsEarned Credits',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textMuted,
                  size: 13,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
