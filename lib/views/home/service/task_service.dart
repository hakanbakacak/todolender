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
      TaskModel(name: "Task-1", date: DateTime(2021, 10, 20), isCompleted: false, taskDescription: "İlk görev açıklaması asdad"),
      TaskModel(name: "Task-2", date: DateTime(2020, 10, 21), isCompleted: false, taskDescription: "İkinci görev açıklaması asdad"),
      TaskModel(name: "Task-3", date: DateTime(2020, 10, 22), isCompleted: false, taskDescription: "İcuncu görev açıklaması asdad"),
      TaskModel(name: "Task-4", date: DateTime(2020, 10, 23), isCompleted: false, taskDescription: "dorduncu görev açıklaması asdad"),
      ];

      return list;
  }

  static Map<DateTime, List> getTaskMap(){
    DateTime selectedDay = DateTime.now();
    return  {
      selectedDay.subtract(Duration(days: 30)): [
        'Read Book 30 min',
        'Call Hakan for birthday',
        'Wash car'
      ],
      selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      selectedDay.subtract(Duration(days: 20)): [
        'Go to GYM',
        'Fix ChessTimerApp timer bug',
        'Walk 30 min',
        'Listen last episode of Lex Fridman\'s Podcast'
      ],
      selectedDay.subtract(Duration(days: 16)): ['Watch Prison Break S4 E14', 'Study Statictics'],
      selectedDay.subtract(Duration(days: 10)): [
        'Read Book 30 min',
        'Do sport 45 min',
        'Learn Keras Data Augmentation'
      ],
      selectedDay.subtract(Duration(days: 4)): [
        'Call Hakan for new project',
        'Water the flowers',
        'Take the Loki to the vet'
      ],
      selectedDay.subtract(Duration(days: 2)): ['Buy new books', 'Write blogpost Rasa X'],
      selectedDay: ['Go to the Bank', 'Stop and take a rest', 'Do Sport 30 min', 'Contribute Open Source'],
      selectedDay.add(Duration(days: 1)): [
        'Go Shopping',
        'Call Hakan for new project',
        'Back up your computer',
        'Read Book 45 min'
      ],
      selectedDay.add(Duration(days: 3)):
          Set.from([
            'Go to GYM',
            'Fix ChessTimerApp notification bug',
          ]).toList(),
      selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      selectedDay.add(Duration(days: 17)): [
        'Go Shopping',
        'Water the flowers',
        'Take the Loki to the vet'
        'Deep dive in MLOPS'
        'Review Project Report'
      ],
      selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      selectedDay.add(Duration(days: 26)): [
        'Read Book 30 min',
        'Call Hakan for birthday',
        'Wash car'
      ],
    };
  }
  //burada sadece belirli tarihler arasındaki taskları donduren bir fonksiyon olabilir
}