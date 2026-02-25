import 'package:flutter/material.dart';

class ThoughtBubble extends StatelessWidget {
  final String text;

  const ThoughtBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Grande bulle
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        // 1ère petite bulle
        Positioned(
          bottom: -18,
          left: 40,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        ),

        // 2ème petite bulle
        Positioned(
          bottom: -32,
          left: 28,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
