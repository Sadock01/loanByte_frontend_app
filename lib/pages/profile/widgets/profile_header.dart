import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String role;

  const ProfileHeader({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final bool isSeller = role == "vendeur";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),

          Stack(
            children: [
              Container(
                width: 125, // même que radius*2
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12), // réduit l'image
                  child: Image.asset(
                    "assets/icons/panier.png",
                    color: Colors.grey,
                    fit: BoxFit.contain, // ne couvre pas tout
                  ),
                ),
              ),
              //              Positioned(
              //   top: -10,
              //   right: -80,
              //   child: ThoughtBubble(
              //     text: "What's on your mind?",
              //   ),
              // ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            "Ma Super Boutique",
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: Colors.black),
          ),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              color: isSeller ? Colors.green.shade300 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                role,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: isSeller ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    "Shop's link slug",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(color: Colors.grey.shade400, thickness: 1),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "https://cdn.example.com/logo.png",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(color: Colors.green),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          "assets/icons/copy_1.png",
                          color: Colors.green,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // if (isSeller)
          //   Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 30),
          //     padding: const EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       color: Colors.orange.shade50,
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: const Text(
          //       "🎉 La boutique est maintenant disponible.\nVeuillez remplir vos informations.",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontSize: 12),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
