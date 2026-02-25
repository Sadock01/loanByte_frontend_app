import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final bool isObscure;
  final VoidCallback? onToggleVisibility;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.isObscure = false,
    this.onToggleVisibility,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? isObscure : false,
        keyboardType: keyboardType,
        // On garde ton style textLabelSmall
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.grey, size: 22),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onToggleVisibility,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          // Un peu de padding horizontal pour ne pas coller au bord
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF311B92), width: 1.5),
          ),
        ),
      ),
    );
  }
}
