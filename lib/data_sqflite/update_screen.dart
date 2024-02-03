import 'package:assignment_two/data_sqflite/sqflite_crud_operations.dart';
import 'package:assignment_two/data_sqflite/model_student.dart';
import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

class ScreenAddRecord extends StatefulWidget {
  const ScreenAddRecord({super.key});

  @override
  State<ScreenAddRecord> createState() => _ScreenAddRecordState();
}

class _ScreenAddRecordState extends State<ScreenAddRecord> {
  String id = "";
  String name = "";

   DatabaseStudent databaseStudent = DatabaseStudent();

  // @override
  // void initState(){
  //   super.initState();
  //
  //  setState(() {
  //    databaseStudent.initializeDatabase();
  //  });
  // }
  @override
  void initState() {
    super.initState();

    databaseStudent.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Add Record")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (String value){
                setState(() {
                  id = value;
                  print("$id");
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (String value){
                setState(() {
                   name = value;
                  print("$name");
                });
              },
            ),
            SizedBox(height: 20),
            Column(
              children: [
                TextButton(onPressed: (){
                  if (id.isNotEmpty) {
                    Modelstudent modelStudent =
                    Modelstudent(id: int.parse(id), name: name);
                    databaseStudent.UpdateStudent(modelStudent).then((value) {
                      if (value) {
                        print("Record updated Successfully");
                      } else {
                        print("Record updation failed");
                      }
                    });
                  } else {
                    print("Must fill the required id field");
                  }
                },  child: Text("Update Record"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
            )),
                SizedBox(height: 20,),
                TextButton(onPressed: () async {
                  Modelstudent modelStudent =
                      Modelstudent(id: int.parse(id), name: name);

                  bool isAdded = await databaseStudent.AddStudent(modelStudent);
                  databaseStudent.AddStudent(modelStudent).then((isAdded){
                    if(isAdded){
                      print("Record Added Successfully");
                    }else {
                      print("Record insertion failed");
                    }
                  });
                }, child: Text("Add Record"), style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
                ),),


                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  if(id.isNotEmpty){
                    // Modelstudent modelStudent =
                    // Modelstudent(id: int.parse(id), name: name);
                    databaseStudent.deleteStudentbyId(id).then((value){
                      if(value){
                        print("Deleted single record Successfully");
                      }else {
                        print("Record deletion failed");
                      }
                    });
                  }
                  else{
                    print("Must fill the required id field");
                  }
                },  child: Text("Delete Single record"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
                    )),

                SizedBox(height: 20,),
                TextButton(onPressed: () async {
                  databaseStudent.DeleteAllStudent().then((isAdded){
                    if(isAdded){
                      print("Record Deletes Successfully");
                    }else {
                      print("Record deletion failed");
                    }
                  });
                }, child: Text("Delete all Record"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
                    )),


                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  if(id.isNotEmpty){
                    Modelstudent modelStudent =
                    Modelstudent(id: int.parse(id), name: name);
                    databaseStudent.GetCountStudent().then((value){
                      print("Total number of record = $value");
                    });
                  }
                  else{
                    print("Must fill the required id field");
                  }
                }, child: Text("Count Record"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
                    )),

                SizedBox(height: 20,),
                TextButton(onPressed: () async {
                  databaseStudent.GetAllStudent().then((List<Modelstudent> List){
                  List.forEach((element){
                    print("id = ${element.id}, Name: ${element.name}" );
                  });
                  });
                }, child: Text("Delete all Record"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
                    )),
              ],
            )
          ],
        ),

      ),
    );
  }
}
