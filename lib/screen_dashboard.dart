
import 'package:assignment_two/data_apis/MODEL/api_model.dart';
import 'package:assignment_two/data_hive/hive_dashboard_screen.dart';
import 'package:assignment_two/data_sqflite/sqflite_dashboard_screen.dart';
import 'package:assignment_two/sqflite/sql_dashboard.dart';

import 'package:flutter/material.dart';



class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  // PrayerTime prayerTime = PrayerTime();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Task #2"),
        centerTitle: true,
      ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 200, height: 40,
              child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => ApiDashboard()));
              },
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
                child: const Text("Api Dashboard"),
              ),
              ),
              const SizedBox(height: 30,),

              SizedBox(width: 200, height: 40,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => const SqfliteDashboardScreen()));
              },
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)), child: const Text("Sqflite Dashboard"),
              ),),

              const SizedBox(height: 20,),

              SizedBox(width: 200, height: 40,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => const HiveDashboardScreen()));
              }, child: const Text("Hive Dashboard"),
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
              ),),
              const SizedBox(height: 20,),

              SizedBox(width: 200, height: 40,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => const ScreenDashboardSqflite()));
              }, child: const Text("Sqlflite data storage"),
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
              ),),

              const SizedBox(height: 20,),

            ],
          ),

        ),

    );
  }
}
