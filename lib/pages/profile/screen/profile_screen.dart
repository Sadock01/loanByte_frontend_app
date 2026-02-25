import 'package:flutter/material.dart';
import 'package:pal_marketplace/pages/profile/widgets/profile_header.dart';
import 'package:pal_marketplace/pages/profile/widgets/profile_table%20switcher.dart';
import 'package:pal_marketplace/pages/profile/widgets/shop_info_section.dart';

import '../../product/screen/product_sreen.dart';

class ProfileScreen extends StatefulWidget {
  final String role; // "client" ou "vendeur"

  const ProfileScreen({super.key, required this.role});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;

  bool get isSeller => widget.role == "vendeur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08), // ombre légère
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                // ombre légère
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            "assets/icons/panier.png",
                            width: 22,
                            height: 22,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Gérer sa boutique",
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ProfileHeader(role: widget.role),

            const SizedBox(height: 12),

            // Afficher switch seulement si vendeur
            if (isSeller)
              ProfileTabSwitcher(
                selectedIndex: selectedTab,
                onChanged: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),

            const SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: isSeller
                      ? (selectedTab == 0
                            ? const ShopInfoSection(
                                email: "moussa@email.com",
                                phone: "+221 77 000 00 00",
                                role: "Client",
                              )
                            : SizedBox())
                      : const SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
