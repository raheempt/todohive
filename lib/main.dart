import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todohive/model/todo_model.dart';
import 'package:todohive/screens/home_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory =await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<TodoModel>(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');
  runApp(MyApp());

  }


class MyApp extends StatelessWidget{
  MyApp({super.key});
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}