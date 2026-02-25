import 'package:flutter/material.dart';

class ProfileTabSwitcher extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const ProfileTabSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildTab("Shop Info", 0, context),
          _buildTab("Settings", 1, context),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index, BuildContext context) {
    final bool isActive = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: isActive ? Colors.black : Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}