
import 'package:nailroom/api/productapi.dart';
import 'package:nailroom/response/productresponse.dart';

class ProductRepository {
  Future<ProductResponse?> getData() async {
    return ProductApi().getProduct();
  }
} 