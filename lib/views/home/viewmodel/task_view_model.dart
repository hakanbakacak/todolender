import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/home/model/task_model.dart';
import 'package:todo_app/views/home/service/task_service.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier{
  List<TaskModel> taskList = new List<TaskModel>();
  Map<DateTime, List> _events;
  
  String codeDialog;
  String valueText;
   
  List _selectedEvents;
  get selectedEvents{
    return _selectedEvents;
  }
  final _selectedDay = DateTime.now();
  DateTime _selectedCalenderCell = DateTime.now();
  TaskViewModel(){
    taskList = TaskService.getTasks();
    _events = TaskService.getTaskMap();
    _selectedEvents = _events[_selectedDay] ?? [];
  }
  get events{
    return _events;
  }

  void onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    _selectedEvents = events;
    _selectedCalenderCell = day;
    
    notifyListeners();
  }

  bool completeTask(int taskId){
    for (var i = 0; i < taskList.length; i++) {
      if(taskList[i].taskId==taskId){
        taskList[i].isCompleted = true;
        notifyListeners();
        return true;
      }
    }
  }

  bool addTask(){
    //TODO service cagirilip task firebase'e gonderilmeli
    print(_selectedCalenderCell);
    _events[_selectedCalenderCell] = [valueText];
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

  TextEditingController _textFieldController = TextEditingController();

    Future<void> displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {
                valueText = value;
                notifyListeners();
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                  notifyListeners();
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {  
                  codeDialog = valueText;
                  Navigator.pop(context);
                  notifyListeners();
                },
              ),

            ],
          );
        });
  }



  

}