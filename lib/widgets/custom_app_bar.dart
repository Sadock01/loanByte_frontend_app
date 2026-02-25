import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.showBack = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leadingWidth: showBack ? 140 : 0,
      leading: showBack
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: GestureDetector(
                onTap: onBack ?? () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, size: 25),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Back",
                        style: Theme.of(context).textTheme.displaySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
