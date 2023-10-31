
import 'package:hive_flutter/adapters.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String contant;

  TodoModel({required this.title,required this.contant});
}