import 'dart:convert';
import 'package:cardreader_native/features/widgets/cards/student_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../features/structs/student.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  Future<List<Student>> getAllStudents() async {

    String url = 'https://ipelab.ru/serv/atten.php?py_get_comm=1';
    Uri uri = Uri.parse(url);

    var response = await get(uri);

    var jsonData = jsonDecode(response.body);

    List<Student> students = [];

    for (var i in jsonData){
      Student student = Student(name: i['name']);
      students.add(student);
    }

    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Student>>(
        future: getAllStudents(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          else{

            List<Student> students = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index){
                  Student student = students[index];

                  return studentCard({'name': student.name, 'description':'null'}, student.active);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
