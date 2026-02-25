import 'package:flutter/material.dart';

import '../../../widgets/modern_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFDF8F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Créer un compte",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Rejoignez-nous pour commencer votre aventure",
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // On réutilise le même widget de TextField
            CustomTextField(
              hint: "Numéro de téléphone",
              icon: Icons.phone_outlined,
            ),
            CustomTextField(hint: "Adresse Email", icon: Icons.email_outlined),
            CustomTextField(
              hint: "Mot de passe",
              icon: Icons.lock_outline,
              isPassword: true,
              isObscure: _isObscure,
              onToggleVisibility: () =>
                  setState(() => _isObscure = !_isObscure),
            ),

            const SizedBox(height: 10),
            Text(
              "En vous inscrivant, vous acceptez nos Conditions d'utilisation.",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF311B92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "S'inscrire",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Même fonction _buildCustomTextField que dans LoginPage...
}
