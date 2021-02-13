import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/views/home/model/task_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/home/service/task_service.dart';


class TaskViewModel extends ChangeNotifier{
  List<TaskModel> taskList = new List<TaskModel>();
  int index = 0;
  int selected_index = 0;

  TaskViewModel(){
    taskList = TaskService.getTasks();
  }

  bool completeTask(int taskId){
    for (var i = 0; i < taskList.length; i++) {
      if(taskList[i].taskId==taskId){
        taskList[i].isComplated = true;
        notifyListeners();
        return true;
      }
    }
  }

  bool addTask(TaskModel task){
    print(index);
    index++;
    //TODO service cagirilip task firebase'e gonderilmeli
    taskList.add(task);
    notifyListeners();
    return true; //firebase'e ekleme basarili ise return true  
  }
  bool deleteTask(int taskId){
    for (var i = 0; i < taskList.length; i++) {
      if(taskList[i].taskId==taskId){
        taskList.remove(i);
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  void selectTask(int i){
    selected_index = i;
  }

}