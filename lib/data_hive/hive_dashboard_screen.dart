// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
// class HiveDashboardScreen extends StatefulWidget {
//   const HiveDashboardScreen({super.key});
//
//   @override
//   State<HiveDashboardScreen> createState() => _HiveDashboardScreenState();
// }
//
// class _HiveDashboardScreenState extends State<HiveDashboardScreen> {
//
//   List<Map<String, dynamic >> record = [];
//   final stdRecord = Hive.box('Student_Record');
//   @override
//   void initState()
//   {
//     super.initState();
//     refreshItem();
//   }
//
//
//   void refreshItem  (){
//     final data = stdRecord.keys.map((key){
//       final item = stdRecord.get(key);
//       return {"key": Key, "name": item["name"], "rollnum": item["rollnum"], "grade": item["grade"]};
//     }).toList();
//
//     setState((){
//       record = data.reversed.toList();
//       print(record.length);
//     });
//   }
//
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController rollNoController = TextEditingController();
//   final TextEditingController gradeController = TextEditingController();
//
//
//
//
//   Future<void> _createItem(Map<String, dynamic> newRecord) async
//   {
//     await stdRecord.add(newRecord);
//     // print("Amount data is ${stdRecord.length}");
//     refreshItem();
//   }
//
//
// Future<void> _updateItem(int itemKey, Map<String, dynamic> item ) async{
//     await stdRecord.put(itemKey, item);
//     refreshItem();
// }
//
// Future<void> _deleteItem(int itemKey) async{
//     await stdRecord.delete(itemKey);
//     refreshItem();
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('An Item has been deleted'))
//     );
// }
//
// void showForm(BuildContext cntx, int? itemKey) async {
//     if(itemKey !=null){
//       final existingItem =
//           record.firstWhere((element) => element['key'] == itemKey);
//       usernameController.text = existingItem['name'];
//       rollNoController.text = existingItem['rollnum'];
//       gradeController.text = existingItem['grade'];
//     }
//     showModalBottomSheet(context: cntx,
//       elevation: 5,
//       isScrollControlled: true,
//       builder: (_) => Container(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(cntx).viewInsets.bottom,
//           top: 15,
//           left: 15,
//           right: 15,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             TextField(
//               controller: usernameController,
//               decoration: const InputDecoration(hintText: "Enter name"),
//             ),
//             const SizedBox(height: 10,),
//
//             TextField(
//               controller: rollNoController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(hintText: "Enter Roll Number"),
//             ),
//             const SizedBox(height: 10,),
//
//             TextField(
//               controller: gradeController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(hintText: "Enter Grade"),
//             ),
//             const SizedBox(height: 10,),
//
//             ElevatedButton(onPressed: () async {
//               if(itemKey == null)
//               {
//               _createItem({
//                 "name": usernameController.text,
//                 "rollnum": rollNoController.text,
//                 "grade": gradeController.text
//               });
//               }
//             if(itemKey != null){
//               _updateItem(itemKey, {
//                 'name': usernameController.text.trim(),
//                 'rollnum': rollNoController.text.trim(),
//                 'grade': gradeController.text.trim(),
//               });
//             }
//
//               usernameController.text = ' ';
//               rollNoController.text = ' ';
//               gradeController.text = ' ';
//               Navigator.of(context).pop();
//             }, child: const Text("Add Data"
//                   ),
//       ),
//             const SizedBox(height: 15,),
//           ],
//
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     FloatingActionButton(onPressed: () {  },child: const Icon(Icons.add),);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hive Dashboard"),
//         backgroundColor: Colors.cyan,
//       ),
//       body: ListView.builder(
//         itemCount:   record.length,
//         itemBuilder: (_, index){
//           final currentItem = record[index];
//           return Card(
//             color: Colors.orange.shade100,
//             margin: const EdgeInsets.all(10),
//             elevation: 3,
//             child: ListTile(
//               title: Text(currentItem['name']),
//               subtitle: Text(currentItem['rollnum'].toString()),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(icon: const Icon(Icons.edit),
//               onPressed: () => showForm(context, currentItem['key'])),
//                   IconButton(icon: const Icon(Icons.delete),
//                       onPressed: () => _deleteItem(currentItem['key'])),
//                 ],
//               ),
//             ),
//
//           );
//         }
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showForm(context, null),
//         child: const Icon(Icons.add),
//
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDashboardScreen extends StatefulWidget {
  const HiveDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HiveDashboardScreen> createState() => _HiveDashboardScreenState();
}

class _HiveDashboardScreenState extends State<HiveDashboardScreen> {
  List<Map<String, dynamic>> record = [];
  final stdRecord = Hive.box('Student_Record');

  @override
  void initState() {
    super.initState();
    refreshItem();
  }

  void refreshItem() {
    final data = stdRecord.keys.map((key) {
      final item = stdRecord.get(key);
      return {
        "key": key,
        "name": item!["name"],
        "rollnum": item["rollnum"],
        "grade": item["grade"]
      };
    }).toList();

    setState(() {
      record = data.reversed.toList();
      print(record.length);
    });
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();

  Future<void> _createItem(Map<String, dynamic> newRecord) async {
    await stdRecord.add(newRecord);
    refreshItem();
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await stdRecord.put(itemKey, item);
    refreshItem();
  }

  Future<void> _deleteItem(int itemKey) async {
    await stdRecord.delete(itemKey);
    refreshItem();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An Item has been deleted')));
  }

  void showForm(BuildContext cntx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
      record.firstWhere((element) => element['key'] == itemKey);
      usernameController.text = existingItem['name'];
      rollNoController.text = existingItem['rollnum'];
      gradeController.text = existingItem['grade'];
    }

    showModalBottomSheet(
      context: cntx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(cntx).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(hintText: "Enter name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: rollNoController,
              keyboardType: TextInputType.number,
              decoration:
              const InputDecoration(hintText: "Enter Roll Number"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: gradeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter Grade"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  _createItem({
                    "name": usernameController.text,
                    "rollnum": rollNoController.text,
                    "grade": gradeController.text
                  });
                }
                if (itemKey != null) {
                  _updateItem(itemKey, {
                    'name': usernameController.text.trim(),
                    'rollnum': rollNoController.text.trim(),
                    'grade': gradeController.text.trim(),
                  });
                }

                usernameController.text = '';
                rollNoController.text = '';
                gradeController.text = '';
                Navigator.of(context).pop();
              },
              child: const Text("Add Data"),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Dashboard"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: record.length,
        itemBuilder: (_, index) {
          final currentItem = record[index];
          return Card(
            color: Colors.orange.shade100,
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(currentItem['name']),
              subtitle: Text(currentItem['rollnum'].toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          showForm(context, currentItem['key'] as int?)),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteItem(currentItem['key'] as int)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
