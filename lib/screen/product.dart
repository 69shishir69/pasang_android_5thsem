import 'package:flutter/material.dart';
import 'package:nailroom/model/product.dart';
import 'package:nailroom/repository/productrepository.dart';
import 'package:nailroom/response/productresponse.dart';
import 'package:nailroom/utils/url.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Expanded(
              //   child: SizedBox(
              //     height: 500,
              //      width: 400,
              //     child: FutureBuilder<ProductResponse?>(
              //                 future: ProductRepository().getData(),
              //                 builder: (context, snapshot) {
              //                   // print(snapshot.data);
              //                   if (snapshot.connectionState ==
              //                       ConnectionState.done) {
              //                     if (snapshot.data != null) {
              //                       // print(snapshot.data);
              //                       List<Product> lstProductdata = snapshot.data!.data!;
              //                       print(lstProductdata[0].Product_image);
              //                       debugPrint(lstProductdata.length.toString());
              //                       return ListView.builder(
              //                         scrollDirection: Axis.horizontal,
              //                         itemCount: lstProductdata.length,
              //                         itemBuilder:
              //                             (BuildContext context, int index) {
              //                           return _getProduct(lstProductdata[index]);
              //                         },
              //                       );
              //                     } else {
              //                       return const Center(
              //                         child: Text("No data"),
              //                       );
              //                     }
              //                   } else if (snapshot.connectionState ==
              //                       ConnectionState.waiting) {
              //                     return const Center(
              //                       child: CircularProgressIndicator(),
              //                     );
              //                   } else if (snapshot.hasError) {
              //                     return Text("${snapshot.error}");
              //                   } else {
              //                     return const Center(
              //                       child: CircularProgressIndicator(
              //                         valueColor: AlwaysStoppedAnimation<Color>(
              //                             Colors.blue),
              //                       ),
              //                     );
              //                   }
              //                 },
              //               ),
              //   ),
              // ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Book Appointment"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _getProduct(Product product) {
    return SizedBox(
      height: 500,
      width: 400,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "$baseUrl${product.Product_image!}",
                fit: BoxFit.cover,
                height: 275,
                width: 275,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.Product_name!),
                  Text(product.Product_price!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
