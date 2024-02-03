// import 'package:assignment_two/screen_dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Hive.initFlutter();
//   await Hive.openBox('Student_Record');
//
//   // sqfliteFfiInit();
//   // databaseFactory = databaseFactoryFfi;
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Assignment 2',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
//         useMaterial3: true,
//       ),
//       home: const ScreenDashboard(),
//     );
//   }
// }
// import 'package:assignment_app/screen_dashboard.dart';
import 'package:assignment_two/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('Student_Record');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SQLITE',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: false),
        home: const ScreenDashboard());
  }
}