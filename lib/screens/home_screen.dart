import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todohive/model/todo_model.dart';
import 'package:todohive/screens/add_todo.dart';
import 'package:todohive/screens/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box todoBox = Hive.box<TodoModel>('todoBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('todo'),backgroundColor: Color.fromARGB(255, 119, 246, 250),),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: todoBox.listenable(),
            builder: (context, todoBox, child) {

if(todoBox.isEmpty){
  return Center(child: Text('no todo'),);
}
         
              return ListView.builder(
                  itemCount: todoBox.length,
                  itemBuilder: (context, index) {
                    TodoModel newTodo = todoBox.getAt(index);

                      return Expanded(
                        child: Card(
                          child: ListTile(
                            // onLongPress: () {},
                            title: Text(newTodo.title),
                            subtitle: Text(newTodo.contant),
                            leading: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditScreen(index: index, tittle: newTodo.title,content: newTodo.contant,)));
                            }, icon:const Icon(Icons.edit,color: Colors.blue,)),
                            trailing: IconButton(
                                onPressed: () {
                                  todoBox.deleteAt(index).then((value) =>  
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  '${newTodo.title}  Deleted'))));
                                },
                                icon: const Icon(Icons.delete_rounded,color: Colors.red,)),
                          ),
                        ),
                      );
                    }
                  );
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddTodo()));
      },
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      child: Icon(Icons.add,
      color: Colors.red ,
      size: 40,),),
    );
  }
}
