import 'package:flutter/material.dart';
import 'package:pal_marketplace/pages/home_screen.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String selectedRole = ""; // "vendeur" ou "client"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFDF8F3),
      // Fond beige léger pour la cohérence
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                "Bienvenue !",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Choisissez votre profil pour commencer",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 60),

              // Containers côte à côte
              Row(
                children: [
                  Expanded(
                    child: _buildRoleCard(
                      role: "client",
                      title: "Client",
                      icon: Icons.shopping_bag_outlined,
                      description: "Je souhaite acheter des produits",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildRoleCard(
                      role: "vendeur",
                      title: "Vendeur",
                      icon: Icons.storefront_outlined,
                      description: "Je souhaite vendre mes produits",
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Bouton de validation
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: selectedRole.isEmpty
                      ? null
                      : () {
                          print("Role sélectionné : $selectedRole");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeMobileScreen(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF311B92),
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Continuer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String role,
    required String title,
    required IconData icon,
    required String description,
  }) {
    bool isSelected = selectedRole == role;

    return GestureDetector(
      onTap: () => setState(() => selectedRole = role),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // Contour vert si sélectionné
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              // Ombre légèrement verte si sélectionné, sinon ombre grise classique
              color: isSelected
                  ? Colors.green.withOpacity(0.2)
                  : Colors.black.withOpacity(0.05),
              blurRadius: isSelected ? 15 : 10,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade50 : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: isSelected ? Colors.green : Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isSelected ? Colors.green.shade700 : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
