import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showMenu; // Nouvelle condition pour le menu
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.showBack = true,
    this.showMenu = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      // Une ombre très légère pour le côté pro
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,

      // On utilise centerTitle pour que le texte soit toujours au milieu
      centerTitle: true,

      // Le bouton retour à gauche
      leading: showBack
          ? Center(
              // Center permet d'éviter que le bouton touche les bords
              child: GestureDetector(
                onTap: onBack ?? () => Navigator.pop(context),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 14,
                  ),
                ),
              ),
            )
          : null,

      title: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),

      // Le menu à droite avec condition
      actions: [
        if (showMenu)
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: IconButton(
                padding: EdgeInsets.zero, // Important pour centrer l'icône
                icon: const Icon(Icons.menu, color: Colors.black, size: 22),
                onPressed: () {
                  // Action du menu
                },
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
