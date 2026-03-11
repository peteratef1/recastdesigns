import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/loyalty_card.dart';
import '../widgets/venue_card.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Welcome Back,',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GradientText(
                            "Asmar Ajlouni",
                            style: AppTextStyles.venueTitle,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.surface,
                            border: Border.all(
                              color: AppColors.border,
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            color: AppColors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Loyalty Card
                LoyaltyCard(
                  points: 21750,
                  totalOrders: 24,
                  progressValue: 0.62,
                  recentFoodImages: const [
                    'assets/1.png',
                    'assets/2.png',
                    'assets/3.png',
                  ],
                  onMoreDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    );
                  },
                ),

                const SizedBox(height: 28),

                // Venue Selection header
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Venue Selection',
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.87),

                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Venue grid
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column
                    Expanded(
                      child: Column(
                        children: [
                          VenueCard(
                            imagePath: 'assets/food5.png',
                            category: 'Nikkei',
                            name: 'Ceano',
                            height: 180,
                          ),
                          const SizedBox(height: 12),
                          VenueCard(
                            imagePath: 'assets/food7.png',
                            category: 'Casual',
                            name: 'Dovely',
                            height: 220,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Right column (offset down slightly like Figma staggered grid)
                    Expanded(
                      child: Column(
                        children: [
                          VenueCard(
                            imagePath: 'assets/food3.png',
                            category: 'Restaurant',
                            name: 'Nobiko',
                            height: 220,
                          ),
                          const SizedBox(height: 12),
                          VenueCard(
                            imagePath: 'assets/food4.png',
                            category: 'Bakery',
                            name: 'Olivestree',
                            height: 180,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
