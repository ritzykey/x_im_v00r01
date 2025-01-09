import 'package:flutter/material.dart';

/// radius is 20
final class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.onPressed,
    super.key,
  });

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Kenar radius değeri
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          Colors.black, // Doğrudan Colors.black olarak geçilir
        ),
      ),
      child: const SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}