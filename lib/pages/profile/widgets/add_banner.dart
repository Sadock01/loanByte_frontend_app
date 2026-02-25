import 'package:flutter/material.dart';

class AddBanner extends StatefulWidget {
  final String title;
  final int initialCount;

  const AddBanner({super.key, required this.title, this.initialCount = 0});

  @override
  State<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  late int count;
  final List<String> categories = [];

  @override
  void initState() {
    super.initState();
  }

  void _showAddBannerSheet() {
    final TextEditingController controller = TextEditingController();
    String? selectedImagePath;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Text(
                        "Bannière de promotion",
                        style: Theme.of(context).textTheme!.labelSmall!
                            .copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () async {
                          // Ici tu peux mettre ton picker d'image
                          // Simule la sélection d'une image:
                          setState(() {
                            selectedImagePath = "assets/images/clothe.jpeg";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                selectedImagePath == null
                                    ? Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffecfdf5),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.image_outlined,
                                          color: Color(0xff16a34a),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          selectedImagePath!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Upload banner image",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "PNG, JPG • Max 10MB",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
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
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            if (controller.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Veuillez entrer un nom pour la bannière",
                                  ),
                                ),
                              );
                              return;
                            }
                            // Ici, tu peux renvoyer les infos au parent, ou gérer l'état
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Ajouter la bannière",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
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
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: _showAddBannerSheet,
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
