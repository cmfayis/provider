import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provideapp/controller/db.dart';
import 'package:provideapp/controller/imagepicker.dart';
import 'package:provideapp/model/Model.dart';
import 'package:provideapp/view/homescreen.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudetModelAdapter());
  await Hive.openBox<StudetModel>('todomodel');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentModelDb()),
        ChangeNotifierProvider(create: (context) => picimage()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: listpage(),
      ),
    );
  }
}