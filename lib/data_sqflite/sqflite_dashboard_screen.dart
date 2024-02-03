import 'package:assignment_two/data_sqflite/model_student.dart';
import 'package:assignment_two/data_sqflite/update_screen.dart';
import 'package:flutter/material.dart';

class SqfliteDashboardScreen extends StatefulWidget {
  const SqfliteDashboardScreen({super.key});

  @override
  State<SqfliteDashboardScreen> createState() => _SqfliteDashboardScreenState();
}

class _SqfliteDashboardScreenState extends State<SqfliteDashboardScreen> {

  String? title;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sqflite Dashboard"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenAddRecord()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
