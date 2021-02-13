import 'package:todo_app/views/home/model/task_model.dart';

class TaskService{
  TaskService _instance;

  TaskService get instance{
    if(_instance == null){

    }
    return _instance; 
  }
  
  static List<TaskModel> getTasks(){
    List<TaskModel> list =[
      TaskModel(name: "İlk Task", date: DateTime(2021, 10, 20), isComplated: false, taskDescription: "İlk görev açıklaması asdad"),
      TaskModel(name: "İkinci Task", date: DateTime(2020, 10, 21), isComplated: false, taskDescription: "İkinci görev açıklaması asdad"),
      TaskModel(name: "ucuncu Task", date: DateTime(2020, 10, 22), isComplated: false, taskDescription: "İcuncu görev açıklaması asdad"),
      TaskModel(name: "dorduncu Task", date: DateTime(2020, 10, 23), isComplated: false, taskDescription: "dorduncu görev açıklaması asdad"),
      ];

      return list;
  }
  //burada sadece belirli tarihler arasındaki taskları donduren bir fonksiyon olabilir
}