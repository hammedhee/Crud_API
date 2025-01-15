import 'dart:developer';

import 'package:apicrud/controller/crud_provider.dart';
import 'package:apicrud/model/crudmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Addpage extends StatelessWidget {
  Addpage({super.key});

  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(180),
              const Center(
                child: Text(
                  'MAKE YOUR EMPLOYEE LIST',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const Gap(30),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 254, 237, 177),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const Gap(30),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          label: const Text('Name'),
                          hintText: 'Enter Your Name',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const Gap(20),
                      TextField(
                        controller: positionController,
                        decoration: InputDecoration(
                          label: const Text('Position'),
                          hintText: 'What Is Your Role?',
                          prefixIcon: const Icon(Icons.work),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const Gap(20),
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          label: const Text('Phone'),
                          hintText: 'Enter Your Phone Number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const Gap(20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          saveBtn(context);
                        },
                        child: const Text(
                          'Save Details',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 void saveBtn(BuildContext context) {
  final name = nameController.text.trim();
  final position = positionController.text.trim();
  final phoneText = phoneNumberController.text.trim();

  if (name.isEmpty || position.isEmpty || phoneText.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill all fields'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  try {
    // Create a Crudmodel instance
    final newCrud = Crudmodel(
      name: name,
      position: position,
      phonenumber: phoneText,
    );

    // Get the provider and add data
    final crudProvider = Provider.of<CrudProvider>(context, listen: false);
    crudProvider.addCrud(newCrud);

    // Go back to the previous screen
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Details saved successfully'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    log('Error adding details: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('An error occurred while saving details'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

}
