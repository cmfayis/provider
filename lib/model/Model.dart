
import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'Model.g.dart';
@HiveType(typeId: 1)
class StudetModel {
 int? id;
  @HiveField(0)
 String name;
  @HiveField(1)
 String age;
  @HiveField(2)
 String email;
  @HiveField(3)
 String phone;
  @HiveField(4)
 String course;
  @HiveField(5)
 Uint8List image;
  StudetModel({
     this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.course,
    required this.image,
  });

}
