import 'package:apicrud/controller/crud_provider.dart';
import 'package:apicrud/view/addpage.dart';
import 'package:apicrud/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CrudProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        routes: {
          'home': (context) => Homepage(),
          'addpage': (context) => Addpage()
        },
      ),
    );
  }
}
