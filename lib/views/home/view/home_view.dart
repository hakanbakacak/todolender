import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/home/model/task_model.dart';
import 'package:todo_app/views/home/viewmodel/task_view_model.dart';
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selected_index= 0 ;
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TaskViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Consumer<TaskViewModel>(builder:(context, state, child) => Text(state.taskList[selected_index].name, style: Theme.of(context).primaryTextTheme.headline4,) ),
      ),
      body:Column(
        children:[
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.red,
            )
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.blue
            )
          )
        ]
      )
    );
  }
}

/*
Container(
            color: Colors.blue,
            child: Consumer<TaskViewModel>(
              builder:(context, state, child) => Center(child:Text(state.taskList[state.selected_index].taskDescription)))
          )*/