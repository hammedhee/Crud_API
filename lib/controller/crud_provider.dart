import 'dart:developer';

import 'package:apicrud/model/crudmodel.dart';
import 'package:apicrud/services/crud_services.dart';
import 'package:flutter/material.dart';

class CrudProvider extends ChangeNotifier {
  final namecontrller = TextEditingController();
  final positioncontroller = TextEditingController();
  final phonnumbercontroller = TextEditingController();

  CrudServices crudServices = CrudServices();
  List<Crudmodel> crudList = [];
  bool isLoding = false;

  Future<void> pGetCrud() async {
    isLoding = true;
    notifyListeners();
    try {
      crudList = await crudServices.getCrud();
      notifyListeners();
    } catch (e) {
      log("error $e");
    }
    isLoding = false;
    notifyListeners();
  }

  void addCrud(Crudmodel newCrud) async {
    try {
      await crudServices.addcrud(newCrud);
      pGetCrud(); // Refresh the list after adding
    } catch (e) {
      log('Error adding CRUD: $e');
    }
  }

  Future updateCrud(namee, positionn, phoneNumberr, String id) async {
    try {
      await crudServices.updateCrud(
          Crudmodel(
              name: namee, position: positionn, phonenumber: phoneNumberr),
          id);
      await pGetCrud();
    } catch (e) {
      log('error$e');
    }
  }

  Future deleteCrud(String id) async {
    try {
      await crudServices.deleteCrud(id);
      await pGetCrud();
    } catch (e) {
      log('error$e');
    }
  }
}
