import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/history_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> historyItems = [
      {
        'image': 'assets/food1.png',
        'restaurant': 'Nobiko Bistro',
        'date': '06 Jan, 2025',
        'amount': '125.32 JD',
        'creditsSpent': 230,
        'creditsEarned': 325,
      },
      {
        'image': 'assets/food2.png',
        'restaurant': 'Nobiko Bistro',
        'date': '06 Jan, 2025',
        'amount': '125.32 JD',
        'creditsSpent': 230,
        'creditsEarned': 325,
      },
      {
        'image': 'assets/food3.png',
        'restaurant': 'Nobiko Bistro',
        'date': '06 Jan, 2025',
        'amount': '125.32 JD',
        'creditsSpent': 230,
        'creditsEarned': 325,
      },
      {
        'image': 'assets/food1.png',
        'restaurant': 'Nobiko Bistro',
        'date': '06 Jan, 2025',
        'amount': '125.32 JD',
        'creditsSpent': 230,
        'creditsEarned': 325,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white.withValues(alpha: 0.75),
                      size: 20,
                    ),
                  ),
                  Text(
                    'Your Profile',
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.75),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.settings_outlined,
                      color: AppColors.white.withValues(alpha: 0.71),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // Profile info row
                      Row(
                        children: [
                          // Avatar
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.border,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/profile.png',
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (c, e, s) => Container(
                                      color: AppColors.surface,
                                      child: const Icon(
                                        Icons.person,
                                        color: AppColors.gold,
                                        size: 36,
                                      ),
                                    ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Name & phone
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Asmar Ajlouni',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '+962 234 567 2349',
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Edit
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Loyalty History heading
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                        child: Text(
                          'Loyalty History',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: 0.82),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // History list
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: historyItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final item = historyItems[index];
                          return HistoryCard(
                            imagePath: item['image'],
                            restaurantName: item['restaurant'],
                            date: item['date'],
                            amount: item['amount'],
                            creditsSpent: item['creditsSpent'],
                            creditsEarned: item['creditsEarned'],
                          );
                        },
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
