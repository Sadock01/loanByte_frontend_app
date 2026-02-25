import 'package:flutter/material.dart';
import 'package:pal_marketplace/pages/start/screen/register_page.dart';
import 'package:pal_marketplace/pages/start/screen/seller_client_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFDF8F3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 100),
            // Logo ou Icone
            const Icon(
              Icons.lock_person_rounded,
              size: 80,
              color: Color(0xFF311B92),
            ),
            const SizedBox(height: 30),
            Text(
              "Bon retour !",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Connectez-vous pour continuer",
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 50),

            // Champ Identifiant (Email ou Numéro)
            _buildCustomTextField(
              hint: "Email ou Numéro de téléphone",
              icon: Icons.person_outline,
            ),

            // Champ Mot de passe
            _buildCustomTextField(
              hint: "Mot de passe",
              icon: Icons.lock_outline,
              isPassword: true,
              isObscure: _isObscure,
              onToggleVisibility: () {
                setState(() => _isObscure = !_isObscure);
              },
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Mot de passe oublié ?",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Color(0xFF311B92),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Bouton de connexion
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RoleSelectionPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF311B92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vous n'avez pas de compte ? ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "S'inscrire",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Color(0xFF311B92),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Utilisation du même style que précédemment
  Widget _buildCustomTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isObscure = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isObscure,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey),
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
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
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
