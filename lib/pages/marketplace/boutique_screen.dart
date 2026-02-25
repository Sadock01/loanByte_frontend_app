// import 'package:flutter/material.dart';
// import 'package:pal_marketplace/constant/const.dart';


// class BoutiqueScreen extends StatelessWidget {
//   const BoutiqueScreen({super.key});

//   // List<ProductModel> get products => [
//   //   ProductModel(
//   //     title: "Dries Van Noten",
//   //     price: "\$580",
//   //     imageUrl: "assets/images/winter_hooby.webp",
//   //     rating: 4.8,
//   //     distance: 1.2,
//   //     time: 'Now',
//   //     location: 'Colorado',
//   //     seller: 'Barack J OBAMA',
//   //     category: 'Equipment electronics',
//   //   ),
//   //   ProductModel(
//   //     title: "Wales Bonner",
//   //     price: "\$280",
//   //     imageUrl: 'assets/images/clothe.jpeg',
//   //     rating: 4.8,
//   //     distance: 1.2,
//   //     time: 'Now',
//   //     location: 'Colorado',
//   //     seller: 'Barack J OBAMA',
//   //     category: 'Equipment electronics',
//   //   ),
//   //   ProductModel(
//   //     title: "Rick Owens",
//   //     price: "\$650",
//   //     imageUrl: 'assets/images/winter_hooby.webp',
//   //     rating: 4.8,
//   //     distance: 1.2,
//   //     time: 'Now',
//   //     location: 'Colorado',
//   //     seller: 'Barack J OBAMA',
//   //     category: 'Equipment electronics',
//   //   ),
//   //   ProductModel(
//   //     title: "Jacquemus",
//   //     price: "\$420",
//   //     imageUrl: "assets/images/winter_cap.webp",
//   //     rating: 4.8,
//   //     distance: 1.2,
//   //     time: 'Now',
//   //     location: 'Colorado',
//   //     seller: 'Barack J OBAMA',
//   //     category: 'Equipment electronics',
//   //   ),
//   //   ProductModel(
//   //     title: "Prada",
//   //     price: "\$720",
//   //     imageUrl: "assets/images/winter_cap.webp",
//   //     rating: 4.8,
//   //     distance: 1.2,
//   //     time: 'Now',
//   //     location: 'Colorado',
//   //     seller: 'Barack J OBAMA',
//   //     category: 'Equipment electronics',
//   //   ),
//   //   ProductModel(
//   //     title: "Balenciaga",
//   //     price: "\$850",
//   //     imageUrl: 'assets/images/clothe.jpeg',
//   //     rating: 4.8,
//   //     distance: 1.2,
//   //     time: 'Now',
//   //     location: 'Colorado',
//   //     seller: 'Barack J OBAMA',
//   //     category: 'Equipment electronics',
//   //   ),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox.expand(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SearchWidget(),
//                 SizedBox(height: 8),
//                 FilterBarWidget(),
//                 const SizedBox(height: 20),
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 16,
//                     crossAxisSpacing: 12,
//                     childAspectRatio: 0.7,
//                     children: products.map((product) {
//                       return ProductCardWidget(product: product);
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
