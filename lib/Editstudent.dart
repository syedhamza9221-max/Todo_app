import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_class/custom_button.dart';
import 'package:student_class/custom_text_field.dart';
import 'package:student_class/student_class.dart';

class Editscreen extends StatefulWidget {
  final Student studentIDForEdit;
  const Editscreen({super.key,required this.studentIDForEdit});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
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

  final newStudent = Student(
    id: widget.studentIDForEdit.id,
    name: name,
    fathername: fatherName,
    rollno: rollno,
  );
  Navigator.pop(context, newStudent);

}


@override
void initState() {
  super.initState();
  nameController.text = widget.studentIDForEdit.name;
  fatherNameController.text = widget.studentIDForEdit.fathername;
  rollnoController.text = widget.studentIDForEdit.rollno;
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Edit Student"),
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
        CustomButton(buttonlable: "save", onbuttonPressed: saveStudent, buttonIcon: Icons.save)


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
        //         "Save",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 18,
        //         )
        //       )
        //     ],
        //    ),
        //   ),
        //  ),
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
        //         "Save",
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

}}