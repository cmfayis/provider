import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provideapp/controller/db.dart';
import 'package:provideapp/model/Model.dart';
import 'package:provideapp/view/add_user.dart';
import 'package:provideapp/view/update.dart';
import 'package:provider/provider.dart';

class listpage extends StatefulWidget {
  listpage({Key? key}) : super(key: key);

  @override
  State<listpage> createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  Box<StudetModel> model = Hive.box<StudetModel>("todomodel");
  final updatetitle = TextEditingController();
  final updateDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Student List',style:GoogleFonts.pacifico(fontSize: 35),),
        backgroundColor:Color.fromARGB(255, 155, 233, 247) ,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 155, 233, 247),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 155, 233, 247), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: model.listenable(),
              builder: (context, Box<StudetModel> box, child) {
                return ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (context, index) {
                    StudetModel todo = box.getAt(index) as StudetModel;
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Update_user(
                                      index: index,
                                      name: todo.name,
                                      age: todo.age,
                                      email: todo.email,
                                      phone: todo.phone,
                                      coures: todo.course,
                                      image: todo.image)));
                        },
                        leading: CircleAvatar(
                            backgroundImage: MemoryImage(todo.image)),
                        title: Text('Name : ${todo.name}'),
                        subtitle: Text('Email : ${todo.email}'),
                        trailing: IconButton(
                          onPressed: () {
                            Provider.of<StudentModelDb>(context,listen: false)
                                .deleteNotes(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
