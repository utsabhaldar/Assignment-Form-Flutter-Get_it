import 'package:assignment_form/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment_form/manager/form_manager.dart';
import 'package:assignment_form/provider/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<FormManager>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assignment Form',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
