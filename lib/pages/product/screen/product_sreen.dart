import 'package:flutter/material.dart';
import 'package:pal_marketplace/widgets/custom_app_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isAlwaysInStock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFDF8F3), // Fond beige très léger
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Carré d'ajout d'image (en haut à gauche)
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            _buildTextField("Product Name"),
            _buildDropdownField("Select product category"),
            _buildTextField("Describe this product", maxLines: 4),
            _buildTextField("Product price in NGN"),
            _buildTextField("Cost Price (Optional)"),

            const SizedBox(height: 20),

            const Text(
              "Product Quantity",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            // Switch In Stock
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product is always in stock",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: Colors.grey),
                  ),
                  Switch(
                    value: isAlwaysInStock,
                    activeColor: const Color(0xFF4CAF50), // Vert
                    onChanged: (value) =>
                        setState(() => isAlwaysInStock = value),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7F0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFFFE0C2).withOpacity(0.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.error, color: Colors.orange, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "You can add variants, tiered pricing, videos, and advanced configurations when you fully access your dashboard.",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Color(0xFF8B6B4E),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Boutons du bas
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF8F9FE),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Back to Images",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Color(0xFF311B92),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Upload Products",
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }

  // Widget pour le champ Catégorie (Dropdown)
  Widget _buildDropdownField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              hint,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade400),
            items: [],
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
