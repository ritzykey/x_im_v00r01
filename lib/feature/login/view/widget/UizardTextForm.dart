import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class UizardTextForm extends StatelessWidget {
  const UizardTextForm({
    required this.heightScale,
    required this.widthScale,
    required this.label,
    required this.controller,
    required this.obscure,
    super.key,
  });

  final double heightScale;
  final double widthScale;
  final String label;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthScale * 327,
      height: heightScale * 48,
      child: TextFormField(
        style: context.general.textTheme.bodyMedium,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: context.general.textTheme.bodySmall,
        ),
      ),
    );
  }
}
