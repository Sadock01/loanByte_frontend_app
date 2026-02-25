import 'package:flutter/material.dart';

class ManageCategoriesSheet extends StatefulWidget {
  const ManageCategoriesSheet({super.key});

  @override
  State<ManageCategoriesSheet> createState() => _ManageCategoriesSheetState();
}

class _ManageCategoriesSheetState extends State<ManageCategoriesSheet> {
  // Liste pour stocker tes catégories
  final List<String> _categories = [""];

  void _addNewField() {
    setState(() {
      _categories.add("");
    });
  }

  void _removeField(int index) {
    setState(() {
      _categories.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barre de drag en haut
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Text(
            "Manage Product Categories",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          // Message d'info bleu/gris
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50]?.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 18, color: Colors.teal[300]),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "You can also select an optional emoji for each category",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Liste dynamique des champs de saisie
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter category name",
                            hintStyle: Theme.of(context).textTheme.labelSmall!
                                .copyWith(color: Colors.grey),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Bouton supprimer (X)
                      GestureDetector(
                        onTap: () => _removeField(index),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bouton + Add New Category
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _addNewField,
              icon: const Icon(Icons.add, size: 18, color: Colors.black),
              label: Text(
                "Add New Category",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Bouton Save violet
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF311B92), // Violet foncé
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Save product categories",
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
    );
  }
}
