import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Satoshi",
);

class GradientText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;

  const GradientText(
    this.text, {
    super.key,
    this.size = 26,
    this.weight = FontWeight.w700,
    required TextStyle style,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback:
          (bounds) => const LinearGradient(
            colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
          ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white, // required for ShaderMask
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }
}

class AppTextColors {
  static TextStyle goldGradient(TextStyle baseStyle) {
    return baseStyle.copyWith(
      foreground:
          Paint()
            ..shader = const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
            ).createShader(const Rect.fromLTWH(0, 0, 200, 20)),
    );
  }
}

class AppTextStyles {
  static const venueTitle = TextStyle(
    fontFamily: "Satoshi",
    fontWeight: FontWeight.w700,
    fontSize: 13,
    height: 1.0,
    letterSpacing: -0.65,
  );
}

class GradientTextProducts extends StatelessWidget {
  final String text;

  const GradientTextProducts(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,

          fontSize: 18,

          letterSpacing: -0.6, // -0.05em of 12px
          foreground:
              Paint()
                ..shader = const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFE4B679), Color(0xFFFEE5C4)],
                  stops: [0.0025, 0.5332],
                ).createShader(Rect.fromLTWH(0, 0, 218, 14)),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF1C1C1C);
  static const Color cardBackground = Color(0xFF1A1A1A);
  static const Color gold = Color(0xFFD4A843);
  static const Color goldLight = Color(0xFFE8C068);
  static const Color goldDark = Color(0xFFB8922E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8A8A8A);
  static const Color secondBackground = Color(0xFF323232);
  static const Color secondaryColor = Color(0xFFE4B679);
  static const Color textMuted = Color(0xFF5A5A5A);
  static const Color progressBackground = Color(0xFF2A2A2A);
  static const Color border = Color(0xFF2E2E2E);
  static const Color creditsChip = Color(0xFFF0D898);
  static const Color textColor = Color(0xFFFEE5C4);
}
