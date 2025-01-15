import 'dart:math';

import 'package:apicrud/controller/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    Provider.of<CrudProvider>(context, listen: false).pGetCrud();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amberAccent,
          onPressed: () {
            Navigator.pushNamed(context, 'addpage');
          },
          child: Icon(
            Icons.add,
            size: 29,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  'MY PENDING WORK LIST',
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            Expanded(
              child: Consumer<CrudProvider>(
                builder: (context, value, child) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.amberAccent,
                      thickness: sqrt1_2,
                    ),
                    itemCount: value.crudList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Name: ${value.crudList[index].name}'),
                        subtitle:
                            Text('Position :${value.crudList[index].position}'    ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
