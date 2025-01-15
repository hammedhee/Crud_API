import 'dart:developer';

import 'package:apicrud/model/crudmodel.dart';
import 'package:dio/dio.dart';

class CrudServices {
  final Dio dio = Dio();
  final String baseUrl = "https://6784bbe91ec630ca33a55cf2.mockapi.io/apicrud";

  Future<List<Crudmodel>> getCrud() async {
    try {
      Response response = await dio.get(baseUrl);
      log("response ${response.data}");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Crudmodel.fromJson(e))
            .toList();
      } else {
        throw Exception('error');
      }
    } catch (e) {
      throw Exception('Failed to get $e');
    }
  }

Future addcrud(Crudmodel crudmodel) async {
  try {
    log("Request Data: ${crudmodel.toJson()}");
    final response = await dio.post(baseUrl, data: crudmodel.toJson());
    log("Response Data: ${response.data}");
  } catch (e) {
    log("Error: $e");
    throw Exception('Failed to add data $e');
  }
}


  Future updateCrud(Crudmodel crudmodel, String id) async {
    try {
      await dio.put('$baseUrl/$id', data: crudmodel.toJson());
    } catch (e) {
      throw Exception("Failed to get data $e");
    }
  }

  Future deleteCrud(String id) async {
    try {
      await dio.delete('$baseUrl/$id');           
    } catch (e) {
      throw Exception("Failed to get data $e");
    }
  }
}
