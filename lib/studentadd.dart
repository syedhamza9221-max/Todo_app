import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_class/custom_button.dart';
import 'package:student_class/custom_text_field.dart';
import 'package:student_class/student_class.dart';


class ForStudentAddStudent extends StatefulWidget{
  const ForStudentAddStudent({super.key});

  @override
  State<ForStudentAddStudent> createState()=>
  _ForStudentAddStudentState();
}
class _ForStudentAddStudentState extends State<ForStudentAddStudent>{
final TextEditingController nameController =
TextEditingController();

final TextEditingController fatherNameController=
TextEditingController();

final TextEditingController rollnoController=
TextEditingController();

void saveStudent(){
  String name = nameController.text;
  String fatherName = fatherNameController.text;
  String rollno = rollnoController.text;

if (name.isNotEmpty && fatherName.isNotEmpty && rollno.isNotEmpty) {


  final newStudent = Student(
    id: Random(). nextInt(1000),
    name: name,
    fathername: fatherName,
    rollno: rollno,
  );
  Navigator.pop(context, newStudent);

}
else {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text("All fields cannot be empty"),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
}
      
    

 
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Add Student"),
    ),

    body: Column(
      spacing: 50,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CustomTextField(
          componentcontroller: nameController,
          hintText: "Enter name",
        ),
        CustomTextField(
          componentcontroller: fatherNameController,
          hintText: "Enter father name",
        ),
        CustomTextField(
          componentcontroller: rollnoController,
          hintText: "Enter roll number",
        ),
        CustomButton(buttonlable: "add", onbuttonPressed: saveStudent, buttonIcon: Icons.add)

        // TextField(

        //   controller: nameController,
        //   decoration: const InputDecoration(
        //     hintText: "Enter name",
        //   ),
        // ),
        // TextField(
        //   controller: fatherNameController,
        //   decoration: const InputDecoration(
        //     hintText: "Enter father name",
        //   ),
        // ),
        //  InkWell(
        //   onTap: () { 
        //     saveStudent();
        //   },
        //   child: Container(
        //     height: 50,
        //     width: 180,
        //     decoration: BoxDecoration(
        //       color: Colors.purple,
        //       borderRadius: BorderRadius.circular(15),
        //     ),
            
        //    child: const Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(
        //         Icons.add,
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         size: 18,
        //       ),
        //       Text(
        //         "Add",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 18,
        //         )
        //       )
        //     ],
        //    ),
        //   ),
        //  )
      ],
    ),
  );
}
}

