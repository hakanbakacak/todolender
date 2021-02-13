class TaskModel{
  int taskId;
  String name;
  DateTime date;
  String taskDescription;
  bool isCompleted;

  TaskModel({this.name, this.taskDescription, this.date, this.isCompleted});

  TaskModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    taskDescription = json['task_description'];
    date = json['date'];
    isCompleted = json['is_complated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['task_description'] = this.taskDescription;
    data['date'] = this.date;
    data['is_complated'] = this.isCompleted;
    return data;
  }

}