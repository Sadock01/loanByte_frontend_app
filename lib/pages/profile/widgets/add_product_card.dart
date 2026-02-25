import 'package:flutter/material.dart';

class AddProductCard extends StatefulWidget {
  final String title;
  final int initialCount;

  const AddProductCard({
    super.key,
    required this.title,
    this.initialCount = 0,
  });

  @override
  State<AddProductCard> createState() => _AddProductCardState();
}

class _AddProductCardState extends State<AddProductCard> {
  late int count;
  final List<String> categories = [];

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void _showAddCategorySheet() {
    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Nouvelle catégorie",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Libellé de la catégorie",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      categories.add(controller.text);
                      count = categories.length;
                    });
                  }
                  Navigator.pop(context);
                },
                child: const Text("Créer"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.labelMedium!
                      .copyWith(color: Colors.black54),
                ),
                const SizedBox(width: 10),
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: _showAddCategorySheet,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }
}