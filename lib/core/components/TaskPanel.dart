import 'package:flutter/material.dart';
import 'package:todo_app/core/components/custom_slider.dart';

class TaskPanel extends StatefulWidget {
  TaskPanel({
    Key key,
    @required this.events,
  }) : super(key: key);

  List events;

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
    child: CustomSlider(pages: widget.events.length != 0 ? 
     List<Container>.generate(widget.events.length, (index) => Container(
       child:Center(child: Text(widget.events[index], style: Theme.of(context).primaryTextTheme.headline6,))
     )) : [Container(child: Center(child: Text("You are free today :)", style: Theme.of(context).primaryTextTheme.headline6,),))]
   ),
    );
  }
}

/**
 * class TaskPanel extends StatefulWidget {
  TaskPanel({
    Key key,
    @required this.text,
  }) : super(key: key);

  String text;

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
    child: Center(child: Text(widget.text, style: Theme.of(context).primaryTextTheme.headline6,)),
    );
  }
}

 */