import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/views/home/viewmodel/task_view_model.dart';
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int selected_index= 0 ;
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;


  @override
  void initState() {
    super.initState();
     final _selectedDay = DateTime.now();
    //******************************************** 
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    //********************************************
    _calendarController = CalendarController();
   
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

   void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TaskViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.80),
        title: Consumer<TaskViewModel>(builder:(context, state, child) => Text(state.taskList[selected_index].name, style: Theme.of(context).primaryTextTheme.headline4,) ),
      ),
      body:Column(
        children:[
          Expanded(
            flex: 5,
            child: TaskPanel(selected_index: selected_index)
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: Theme.of(context).accentColor,
              child: TableCalendar(
                events: _events,//TODO events should be taken from viewmodel
                calendarController: _calendarController,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: _onDaySelected,
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

class TaskPanel extends StatefulWidget {
  const TaskPanel({
    Key key,
    @required this.selected_index,
  }) : super(key: key);

  final int selected_index;

  @override
  _TaskPanelState createState() => _TaskPanelState();
}

class _TaskPanelState extends State<TaskPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(bottomRight:Radius.circular(50), bottomLeft:Radius.circular(50) )),
    child: Center(child: Consumer<TaskViewModel>(builder: (context, state, child) => Text(state.taskList[widget.selected_index].taskDescription),)),
    );
  }
}
