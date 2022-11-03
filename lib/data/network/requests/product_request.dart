import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';

import '../../data_providers/remote/dio_helper.dart';

class ProductRequest {
  ProductRequest._();
  static final ProductRequest instance = ProductRequest._();
  Future<Response<dynamic>> call() async {
    return await DioHelper.getData(
      url: getProducts,
    );
  }
}
