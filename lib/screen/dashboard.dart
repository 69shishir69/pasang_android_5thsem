// import 'package:flutter/material.dart';
// import 'package:nailroom/model/product.dart';
// import 'package:nailroom/repository/productrepository.dart';
// import 'package:nailroom/response/productresponse.dart';
// import 'package:nailroom/utils/url.dart';

// class ProductScreen extends StatefulWidget {
//   const ProductScreen({Key? key}) : super(key: key);

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("Nailroom Dashboard")),
//       ),
//       body: SafeArea(
//         child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: FutureBuilder<ProductResponse?>(
//               future: ProductRepository().getData(),
//               builder: (context, snapshot) {
//                 // print(snapshot.data);
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.data != null) {
//                     // print("done");
//                     List<Product> lstProductdata = snapshot.data!.data!;
//                     return GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 1.5,
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 10,
//                       ),
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       // scrollDirection: Axis.horizontal,
//                       itemCount: lstProductdata.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return _getProduct(lstProductdata[index]);
//                       },
//                     );
//                   } else {
//                     return const Center(
//                       child: Text("No data"),
//                     );
//                   }
//                 } else if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text("${snapshot.error}");
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                     ),
//                   );
//                 }
//               },
//             )),
//       ),
//     );
//   }

//   _getProduct(Product product) {
//     return Stack(
//       children: [
//         SizedBox(
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: Image.network(
//               "$baseUrl${product.Product_image!}",
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 8,
//           left: 2,
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.Product_name!,
//                   style: const TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   product.Product_price!,
//                   style: const TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }