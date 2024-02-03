// import 'package:assignment_two/data_apis/api_dashboard_screen.dart';
import 'package:assignment_two/data_apis/MODEL/prayer_time_detail.dart';
import 'package:assignment_two/data_apis/services/services_apis.dart';
import 'package:assignment_two/data_hive/hive_dashboard_screen.dart';
import 'package:assignment_two/data_sqflite/sqflite_dashboard_screen.dart';
import 'package:assignment_two/sqflite/sql_dashboard.dart';
// import 'package:assignment_two/sqflite/sql_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:assignment_two/data_apis/api_dashboard_screen.dart';

import 'data_apis/MODEL/prayer_time.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  PrayerTime prayerTime = PrayerTime();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Assignment #2"),
      ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Create an instance of the PrayerTimesService
                    final PrayerTimesService _prayerTimesService = PrayerTimesService();

                    // Fetch prayer time data
                    final PrayerTime prayertime = await _prayerTimesService.getPrayerTimeData();

                    // Navigate to the PrayerTimesPage passing the prayer time data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayerTimesPage(prayerTime: prayertime),
                      ),
                    );
                  } catch (e) {
                    print('Error fetching prayer time data: $e');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan),
                ),
                child: Text("Apis Dashboard"),
              )

              //  ElevatedButton(onPressed: () {
             //    Navigator.push(context, MaterialPageRoute(builder: (builder) => PrayerTimesDetailPage()));
             //  },
             //    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)), child: const Text("Apis Dashboard"),),
             // SizedBox(height: 20,),
              ,ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => SqfliteDashboardScreen()));
              },
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)), child: const Text("Sqflite Dashboard"),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => HiveDashboardScreen()));
              }, child: const Text("Hive Dashboard"),
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),

              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => ScreenDashboardSqflite() ));
              }, child: const Text("Sqlflite attempt 2"),
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),

              ),
              SizedBox(height: 20,),

            ],
          ),

        ),

    );
  }
}
