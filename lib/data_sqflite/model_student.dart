import 'package:assignment_two/main.dart';

class Modelstudent {
  int id;
  String name;

  Modelstudent({required this.id,required this.name});

  Map<String, dynamic> toMap() => {
    "id" : id, "name": name
  };
  factory Modelstudent.ModelObjfromMap(Map<String, dynamic> map_value) =>
      Modelstudent(
          id: map_value["id"], name: map_value["name"]
      );
}
