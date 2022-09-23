import 'package:flutter/material.dart';
class CallingListPage extends StatefulWidget {
  const CallingListPage({Key? key}) : super(key: key);

  @override
  State<CallingListPage> createState() => _CallingListPageState();
}

class _CallingListPageState extends State<CallingListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Calling App"),
    );
  }
}
