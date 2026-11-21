import 'package:flutter/material.dart';

import '../theme.dart';


class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          textStyle: const TextStyle(
            fontFamily: AppText.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(label),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.arrow_forward, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
