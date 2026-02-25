import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: TextField(
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          hintText: "Men's fashion",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black, // Couleur de la bordure
              width: 1.5, // Épaisseur de la bordure
            ),
          ),
          suffixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }
}
