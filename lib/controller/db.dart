import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provideapp/model/Model.dart';


class StudentModelDb extends ChangeNotifier {
  Box todoBox = Hive.box<StudetModel>('todomodel');

  addNotes(String name, String age, String email, String phone, String course,
      Uint8List image) {
    StudetModel newDetail = StudetModel(
        name: name,
        age: age,
        email: email,
        phone: phone,
        course: course,
        image: image);
    todoBox.add(newDetail);
  }
  deleteNotes(int index) async {
    await todoBox.deleteAt(index);
  }

  updateNotes(int index, String name, String age, String email, String phone,
      String course, Uint8List image) {
    StudetModel newDetail = StudetModel(
        name: name,
        age: age,
        email: email,
        phone: phone,
        course: course,
        image: image);
    todoBox.putAt(index, newDetail);
  }
}
