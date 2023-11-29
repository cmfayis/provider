import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provideapp/controller/db.dart';
import 'package:provideapp/controller/imagepicker.dart';
import 'package:provideapp/widgets/const_values/const.dart';
import 'package:provideapp/widgets/textfield.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final rollnumberController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();
  final _key = GlobalKey<FormState>();

  void buttonPress() async {
    final name = nameController.text;
    final age = ageController.text;
    final email = emailController.text;
    final phone = phoneController.text;
    final course = courseController.text;

    String filePath =
        Provider.of<picimage>(context, listen: false).selectedimagepath;

    Uint8List imageBytes = await File(filePath).readAsBytes();

    Provider.of<StudentModelDb>(context, listen: false)
        .addNotes(name, age, email, phone, course, imageBytes);
    nameController.clear();
    ageController.clear();
    emailController.clear();
    phoneController.clear();
    courseController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 155, 233, 247),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 155, 233, 247), Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    Text('Add Student',style:GoogleFonts.pacifico(fontSize: 35),),
                    SizedBox(height: 30,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 155, 233, 247)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(
                          children: [
                            // Provider.of<picimage>(context).selectedimagepath.isEmpty
                            //     ? Text('Select Image')
                            //     : CircleAvatar(
                            //         radius: 50.0,
                            //         backgroundImage: FileImage(
                            //           File(Provider.of<picimage>(context).selectedimagepath),
                            //         ),
                            //       ),
                            sizedbox,
                            CustomTextFormField(
                              controller: nameController,
                              labelText: 'First Name',
                              hintText: 'First Name',
                              validator: nameValidate,
                              icons: Icon(Icons.person),
                            ),
                            sizedbox,
                            CustomTextFormField(
                              controller: ageController,
                              labelText: 'Age',
                              hintText: 'Age',
                              validator: ageValidate,
                              icons: Icon(Icons.person),
                            ),
                            sizedbox,
                            CustomTextFormField(
                              controller: emailController,
                              labelText: 'Email',
                              hintText: 'Email',
                              validator: emailValidate,
                              icons: Icon(Icons.email),
                            ),
                            sizedbox,
                            CustomTextFormField(
                              controller: phoneController,
                              labelText: 'Phone',
                              hintText: 'Phone',
                              validator: phoneValidate,
                              icons: Icon(Icons.phone),
                            ),
                            sizedbox,
                            CustomTextFormField(
                              controller: courseController,
                              labelText: 'Course',
                              hintText: 'Course',
                              validator: nameValidate,
                              icons: Icon(Icons.person),
                            ),
                            sizedbox,
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  Provider.of<picimage>(context, listen: false)
                                      .getimage(ImageSource.camera);
                                },
                                child: Text("Add Image"),
                              ),
                            ),
                            sizedbox,
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    buttonPress();
                                  }
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
