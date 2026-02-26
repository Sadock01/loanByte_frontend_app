import 'package:flutter/material.dart';
import 'package:pal_marketplace/pages/profile/screen/profile_screen.dart';

import '../pages/marketplace/screen/boutique_screen.dart';

class bottomConst {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static List<Map<String, dynamic>> bottomList = [
    {
      'icon': Image.asset("assets/icons/home_out.png", width: 21, height: 21),
      'active_icon': Image.asset(
        "assets/icons/home.png",
        width: 45,
        height: 45,
        color: Colors.green,
      ),
      "screen": BoutiqueScreen(),
      "label": "Home",
    },
    // {
    //   'icon': Image.asset("assets/icons/panier.png", width: 28, height: 28),
    //   'is_center': true, // marque le bouton flottant central
    // },
    {
      'icon': Image.asset("assets/icons/user1.png", width: 21, height: 21),
      'active_icon': Image.asset(
        "assets/icons/user.png",
        width: 45,
        height: 45,
        color: Colors.green,
      ),
      "screen": ProfileScreen(role: "vendeur"),
      "label": "Profile",
    },
  ];
}
