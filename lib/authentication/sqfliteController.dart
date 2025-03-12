import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uni_app/authentication/StudentController.dart';

Database? database;
Map<String, dynamic> profileData = {};

class SqfliteController {
  Future<void> fetchStudentData(String id) 
  async {
    await Studentcontroller().fetchStudentdetails(id).then((value) {
      profileData = value;
    });
  }
}
