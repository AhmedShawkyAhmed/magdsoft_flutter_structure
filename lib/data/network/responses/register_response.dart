import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/status_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';

Future<StatusModel?> registerResponse({
  required String fullName,
  required String email,
  required String phone,
  required String password,
}) async {
  Response? data;
  StatusModel? statusModel;
  try {
      data =
      await registerRequest(
        name: fullName, email: email, password: password, phone: phone,);
      if (data.data == null) {
        throw Exception('Response data is null!');
      }
      else {
        statusModel = StatusModel.fromJson(data.data);
      }

  } on Exception catch (e) {
    log('Error -> Failed request : $e');
  }
  return statusModel;
}


