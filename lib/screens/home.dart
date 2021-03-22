import '../screens/standard_screen.dart';
import 'package:flutter/material.dart';

class CalcHome extends StatefulWidget {
  bool _standardSelected = true;
  bool _scientificSelected = false;
  @override
  _CalcHomeState createState() => _CalcHomeState();
}

class _CalcHomeState extends State<CalcHome> {
  Widget _buildListTile(
      {IconData icon, String title, bool selected, Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(title),
      onTap: () => onTap(),
      selected: selected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  top: 30,
                ),
                child: Text(
                  "Calculator",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.calculate,
                  size: 40,
                ),
                title: Text("Standard"),
                onTap: () {
                  setState(() {
                    widget._standardSelected = true;
                    widget._scientificSelected = false;
                  });
                },
                selected: widget._standardSelected,
              ),
              ListTile(
                leading: Icon(
                  Icons.science,
                  size: 40,
                ),
                title: Text("Scientific"),
                onTap: () {
                  setState(() {
                    widget._standardSelected = false;
                    widget._scientificSelected = true;
                  });
                },
                selected: widget._scientificSelected,
              ),
            ],
          ),
        ),
      ),
      body: StandardScreen(),
    );
  }
}
