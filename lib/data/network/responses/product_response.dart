import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/product_request.dart';

class ProductResponse {
  ProductResponse._();
  static final ProductResponse instance = ProductResponse._();

  Future<List<ProductModel>> call() async {
    final request = await ProductRequest.instance();
    final List<dynamic> response = request.data['products'];
    final data = response.map((e) => ProductModel.fromJson(e)).toList();
    return data;
  }
}
