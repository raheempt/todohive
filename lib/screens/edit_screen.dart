
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todohive/model/todo_model.dart';


class EditScreen extends StatefulWidget {

  String tittle;
  String content;
  int index;
   EditScreen({required this.index,required this.content, required this.tittle, super.key});


  @override
  State<EditScreen> createState() => _EditScreenState();  
}

class _EditScreenState extends State<EditScreen> {
   final titleControllar = TextEditingController();
  final contentControllar = TextEditingController();      
  Box todoBox = Hive.box<TodoModel>('todoBox');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBar(title: Text('update'),backgroundColor: Color.fromARGB(255, 26, 149, 231),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
controller: titleControllar..text=widget.tittle,
   decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),



            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: contentControllar..text=widget.content,
                 decoration: InputDecoration(
                  labelText: 'content',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
            ),
            ElevatedButton(onPressed: (){

              TodoModel edit =TodoModel(title: titleControllar.text.toUpperCase(), contant: contentControllar.text.toString());

              todoBox.putAt(widget.index, edit);
              Navigator.pop(context);
            }, child: Text('Save '))
          ],
        ),
      ),
  );
  }
}