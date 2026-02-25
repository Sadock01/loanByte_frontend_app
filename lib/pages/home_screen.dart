import 'package:flutter/material.dart';

import '../widgets/bottom_const.dart';

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeMobileScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (bottomConst.bottomList[index].containsKey('is_center')) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomConst.bottomList[_currentIndex]['screen'],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bottomConst.bottomList.length, (index) {
            final item = bottomConst.bottomList[index];

            if (item.containsKey('is_center')) {
              final isActive = _currentIndex == index;
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.blue : Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/panier.png",
                      width: 24,
                      height: 24,
                      color: isActive ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }

            final isActive = _currentIndex == index;
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isActive ? item['active_icon'] : item['icon'],
                  const SizedBox(height: 4),
                  item['label'] == ""
                      ? SizedBox()
                      : Text(
                          item['label'],
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: isActive
                                    ? Colors.green
                                    : Colors.grey.shade500,
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                        ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
