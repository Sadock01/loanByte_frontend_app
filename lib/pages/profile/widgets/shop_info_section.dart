import 'package:flutter/material.dart';

import 'add_banner.dart';
import 'add_product_card.dart';
import 'add_stat_card.dart';

class ShopInfoSection extends StatelessWidget {
  final String email;
  final String phone;
  final String role;
  final void Function()? onEdit;

  const ShopInfoSection({
    super.key,
    required this.email,
    required this.phone,
    required this.role,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: () => _showEditSheet(context),
              icon: Image.asset("assets/icons/edit.png", width: 15, height: 15),
              label: Text(
                "Edit",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),

        _shopCard(
          context,
          title: "Email",
          value: email,
          imagePath: "assets/icons/mail.png",
        ),

        _shopCard(
          context,
          title: "Téléphone",
          value: phone,
          imagePath: "assets/icons/calling.png",
        ),

        _shopCard(
          context,
          title: "Statut",
          value: role,
          imagePath: "assets/icons/id-card.png",
        ),
        _shopCard(
          context,
          title: "Nom du Business",
          value: "Ma Super Boutique",
          imagePath: "assets/icons/panier.png",
        ),

        _shopCard(
          context,
          title: "Localisation",
          value: "Dakar, Sénégal",
          imagePath: "assets/icons/location.png",
        ),
        AddCategoryCard(title: "Catégories", initialCount: 2),
        const SizedBox(height: 10),

        AddProductCard(title: "Produits", initialCount: 25),
        const SizedBox(height: 10),
        AddBanner(title: "Ajouter bannière"),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _shopCard(
    BuildContext context, {
    required String title,
    required String value,
    String? imagePath,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          if (imagePath != null)
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          maxChildSize: 0.95,
          minChildSize: 0.6,
          builder: (_, controller) {
            return Container(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 30,
              ),
              decoration: const BoxDecoration(
                color: Color(0xfff9fafb),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Drag Indicator
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Text(
                      "Modifier la boutique",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    _modernField(context, label: "Nom du business"),
                    _modernField(context, label: "Email"),
                    _modernField(context, label: "Téléphone"),
                    _modernField(context, label: "Localisation"),
                    _modernField(context, label: "Statut"),

                    const SizedBox(height: 25),

                    _modernLogoUploader(context),

                    const SizedBox(height: 35),

                    /// Save Button
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Color(0xff16a34a), Color(0xff22c55e)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Enregistrer les modifications",
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _modernLogoUploader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: const Color(0xffecfdf5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.image_outlined, color: Color(0xff16a34a)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload business Logo",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "PNG, JPG • Max 10MB",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.cloud_upload_outlined),
        ],
      ),
    );
  }

  Widget _modernField(
    BuildContext context, {
    required String label,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: Colors.green.shade700,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.green.shade700, width: 2),
              ),
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
