import 'package:flutter/material.dart';

/// radius is 20
final class NormalButton extends StatelessWidget {
  const NormalButton({
    required this.title,
    required this.onPressed,
    this.icon,
    super.key,
  });

  /// title text
  final String title;
  final Widget? icon;

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
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
      label: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      icon: icon,
    );
  }
}
