import 'package:flutter/material.dart';
import 'package:student_class/Editstudent.dart';
import 'package:student_class/studentadd.dart';

class Student {
  int id;
  String name;
  String fathername;
  String rollno;
  List<String>? subjects;

  Student({
    required this.id,
    required this.name,
    required this.fathername,
    required this.rollno,
    this.subjects,
  });
}

class StudentClass extends StatelessWidget {
  const StudentClass({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const ClassstudenState();
  }
}

class ClassstudenState extends StatefulWidget {
  const ClassstudenState({super.key});

  @override
  State<ClassstudenState> createState() => _ClassstudenStateState();
}

class _ClassstudenStateState extends State<ClassstudenState> {
  List<Student> students = [
    Student(id: 1, name: 'John Doe', fathername: 'Jane Doe', rollno: '12345'),
    Student(id: 2, name: 'Alice Smith', fathername: 'Bob Smith', rollno: '67890'),
    Student(id: 3, name: 'Charlie Brown', fathername: 'David Brown', rollno: '54321'),
    
  ];

  Future<void> navigateToAddStudent(BuildContext context) async {
    final newStudent = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForStudentAddStudent()),
    );

    if (newStudent != null && newStudent is Student) {
      setState(() {
        students.add(newStudent);
      });
    }
  }

  void editStudent(Student studentIDForEdit) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Editscreen(studentIDForEdit: studentIDForEdit),
      ),
    );
    print('Result from edit screen: $result');

    int foundIndex = students.indexWhere(
      (student) => student.id == result.id);
    students[foundIndex] = result;

    setState(() {});
  }

  // );

  // if (editedStudent != null && editedStudent is Student) {
  //   setState(() {
  //     students[index] = editedStudent;
  //   });
  // }

  // int nextId = 1;
  void deleteStudent(Student studentIDForEdit) {
    setState(() {
      students.remove(studentIDForEdit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('student manager')),
      body: ListView.builder(
        itemCount: students.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final student = students[index];
          return Container(
            height: 100,
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text(student.name),
                Text(student.fathername),
                Text(student.rollno),
                IconButton(
                  onPressed: () => deleteStudent(student),
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () => editStudent(student),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddStudent(context);
        },

        // onPressed: () {
        //   ();
        //   setState(() {
        //     students.add(
        //       Student(name: 'Students $nextId', fathername: 'Father $nextId'),
        //     );
        //     nextId++;
        //   });
        // },
        child: const Icon(Icons.add),
      ),
    );
  }
}
