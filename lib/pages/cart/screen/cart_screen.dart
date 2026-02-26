import 'package:flutter/material.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../checkout/screen/checkout screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Liste des quantités pour chaque article
  List<int> quantities = [1, 1, 1];
  final double pricePerItem = 45000.0;

  // Calcul du total dynamique
  double get totalAmount {
    return quantities.fold(0, (sum, qty) => sum + (qty * pricePerItem));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFDF8F3), // Fond beige soft
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: quantities.length,
              itemBuilder: (context, index) =>
                  _buildCartItem(context, index), // Passage de l'index
            ),
          ),
          _buildSummarySection(context),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          // Image Produit
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1591047134402-3939f3b7fc6a?q=80&w=1000",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Veste en Lin",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${pricePerItem.toStringAsFixed(0)} NGN",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF311B92),
                  ),
                ),
              ],
            ),
          ),
          // PARTIE QUANTITÉ INTERACTIVE
          Column(
            children: [
              _qtyButton(Icons.add, () {
                setState(() {
                  quantities[index]++;
                });
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "${quantities[index]}",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              _qtyButton(Icons.remove, () {
                setState(() {
                  if (quantities[index] > 1) {
                    quantities[index]--;
                  }
                });
              }),
            ],
          ),
        ],
      ),
    );
  }

  // Ajout du paramètre onTap pour rendre le bouton cliquable
  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: Colors.black),
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                "${totalAmount.toStringAsFixed(0)} NGN", // Total dynamique !
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF311B92),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutScreen(),
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
                "Lancer la commande",
                style: TextStyle(
                  color: Colors.white,
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
