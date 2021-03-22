import 'package:flutter/material.dart';

class StandardWidget extends StatelessWidget {
  final dynamic keyType;
  final String title;
  final Function tapHandler;

  const StandardWidget(this.keyType, this.title, this.tapHandler);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        height: 50,
        child: OutlineButton(
          hoverColor: Colors.grey[350],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          onPressed: () => tapHandler(keyType),
        ),
      ),
    );
  }
}
