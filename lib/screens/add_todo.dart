import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todohive/model/todo_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titleControllar = TextEditingController();
  final contentControllar = TextEditingController();
  Box todoBox = Hive.box<TodoModel>('todoBox');

  
// @override
//   void dispose() {
//     titleControllar.dispose();
//     contentControllar.dispose();
//     super.dispose();
//   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: titleControllar,
             decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
          ),
                      SizedBox(height: 10,),

          TextFormField(
            controller: contentControllar,
             decoration: InputDecoration(
              
                  labelText: 'content',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
          ),
          ElevatedButton(onPressed: (){
            TodoModel newTodo =TodoModel(title: titleControllar.text.toString(), contant:contentControllar.text.toString());
              todoBox.add(newTodo);
              Navigator.pop(context);

          }, child: const Text('Save'))
        ],
      ),),
    );
  }
}