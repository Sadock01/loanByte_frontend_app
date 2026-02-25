import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductModel product;

  const ProductCardWidget({super.key, required this.product});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  int selectionCount = 0;

  void _increment() {
    setState(() => selectionCount++);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _increment,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image du produit
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(widget.product.imageUrls[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.product.category, // Ou un libellé de catégorie
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${widget.product.price.toStringAsFixed(0)} NGN",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Color(0xFF311B92),
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Badge de sélection (Nombre d'occurrences)
          if (selectionCount > 0)
            Positioned(
              top: -5,
              right: -5,
              child: AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white, // Vert moderne
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  child: Center(
                    child: Text(
                      "$selectionCount",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          // Dans le Stack du ProductCardWidget, avant ou après le badge de sélection :
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF5252), Color(0xFFFF1744)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "-20%", // Tu peux calculer cela via (price - promoPrice)
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
