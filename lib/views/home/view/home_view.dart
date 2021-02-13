import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/views/home/viewmodel/task_view_model.dart';
import 'package:todo_app/core/components/TaskPanel.dart';
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int selected_index= 0 ;
  CalendarController _calendarController;
  

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
   
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TaskViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white, size: 40,),
        backgroundColor: Theme.of(context).focusColor,
        onPressed:() {
           vm.displayTextInputDialog(context);
          vm.addTask();
        },
      ),
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.80),
        title: Text("Todolender")
      ),
      body:Column(
        children:[
          Expanded(
            flex: 5,
            child: Consumer<TaskViewModel>(builder:(context, state, child) => TaskPanel(events:state.selectedEvents ,))
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: Theme.of(context).accentColor,
              child: TableCalendar(
                events: vm.events,//TODO events should be taken from viewmodel
                calendarController: _calendarController,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: vm.onDaySelected,
                calendarStyle: CalendarStyle(
                  //markersColor: Theme.of(context).primaryColor
                ),
              ),
            )
          )
        ]
      )
    );
  }
}

