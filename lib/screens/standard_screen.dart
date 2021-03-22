import 'package:calc_app/models/operator.dart';
import 'package:calc_app/widgets/standard_widget.dart';
import 'package:flutter/material.dart';

class StandardScreen extends StatefulWidget {
  @override
  _StandardScreenState createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  String entryText = "0";

  double result = 0;
  String historyText = "";
  final Map<Object, String> symbolList = {
    Operand.ONE: "1",
    Operand.TWO: "2",
    Operand.THREE: "3",
    Operand.FOUR: "4",
    Operand.FIVE: "5",
    Operand.SIX: "6",
    Operand.SEVEN: "7",
    Operand.EIGHT: "8",
    Operand.NINE: "9",
    Operand.ZERO: "0",
    Operand.DOT: ".",
    Operator.ADD: "+",
    Operator.SUBSTRACT: "-",
    Operator.MULTIPLY: "×",
    Operator.DIVISION: "÷",
    Operator.EQUAL: "=",
    Operator.PERCENTAGE: "%",
    Operator.PLUS_OR_MINUS: "⁺/-",
    Operator.DIVIDE_ONE: "¹/x",
    Operator.SQUARE: "x²",
    Operator.SQUARE_ROOT: "√",
    Operator.CLEAR_ENTRY: "CE",
    Operator.CLEAR: "C",
    Operator.BACKSPACE: "\u{232b}",
  };

  void tapHandler(dynamic keyType) {
    if (keyType.runtimeType == Operator) {
      switch (keyType) {
        case Operator.CLEAR_ENTRY:
          clearEntry();
          break;
        case Operator.CLEAR:
          clear();
          break;
        case Operator.BACKSPACE:
          delete();
          break;
        case Operator.PLUS_OR_MINUS:
          plusOrMinus();
          break;
      }
    } else if (keyType.runtimeType == Operand) {
      if (keyType == Operand.DOT) {
        if (entryText.contains(".")) {
          return;
        }
      } else if (keyType == Operand.ZERO) {
        if (entryText == "0") {
          return;
        }
      }
      setState(() {
        if (entryText == "0" && keyType != Operand.DOT) {
          entryText = symbolList[keyType];
        } else {
          entryText += symbolList[keyType];
        }
      });
    }
  }

  void evaluate(String expession) {}

  void validate() {}

  void plusOrMinus() {
    if (entryText == "0") {
      return;
    }
    setState(() {
      entryText = entryText.startsWith("-")
          ? entryText.substring(1, entryText.length)
          : "-" + entryText;
    });
  }

  void delete() {
    setState(() {
      entryText = entryText.length == 1
          ? "0"
          : entryText.substring(0, entryText.length - 1);
      if (entryText.length == 1 && entryText.startsWith("-")) {
        entryText = "0";
      }
    });
  }

  void clearEntry() {
    setState(() {
      entryText = "0";
    });
  }

  void clear() {
    setState(() {
      entryText = "0";
      historyText = "";
    });
  }

  void startMemoryHistory(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, right: 20),
          child: Text(
            "expression text",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          height: 100,
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
          child: FittedBox(
            child: Text(
              entryText,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () {},
                child: Text("MC"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {},
                child: Text("MR"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {},
                child: Text("M+"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {},
                child: Text("M-"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {},
                child: Text("MS"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => startMemoryHistory(context),
                child: Text("M^"),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  StandardWidget(
                    Operator.PERCENTAGE,
                    symbolList[Operator.PERCENTAGE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.CLEAR_ENTRY,
                    symbolList[Operator.CLEAR_ENTRY],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.CLEAR,
                    symbolList[Operator.CLEAR],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.BACKSPACE,
                    symbolList[Operator.BACKSPACE],
                    tapHandler,
                  ),
                ],
              ),
              Row(
                children: [
                  StandardWidget(
                    Operator.DIVIDE_ONE,
                    symbolList[Operator.DIVIDE_ONE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.SQUARE,
                    symbolList[Operator.SQUARE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.SQUARE_ROOT,
                    symbolList[Operator.SQUARE_ROOT],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.DIVISION,
                    symbolList[Operator.DIVISION],
                    tapHandler,
                  ),
                ],
              ),
              Row(
                children: [
                  StandardWidget(
                    Operand.SEVEN,
                    symbolList[Operand.SEVEN],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.EIGHT,
                    symbolList[Operand.EIGHT],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.NINE,
                    symbolList[Operand.NINE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.MULTIPLY,
                    symbolList[Operator.MULTIPLY],
                    tapHandler,
                  ),
                ],
              ),
              Row(
                children: [
                  StandardWidget(
                    Operand.FOUR,
                    symbolList[Operand.FOUR],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.FIVE,
                    symbolList[Operand.FIVE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.SIX,
                    symbolList[Operand.SIX],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.SUBSTRACT,
                    symbolList[Operator.SUBSTRACT],
                    tapHandler,
                  ),
                ],
              ),
              Row(
                children: [
                  StandardWidget(
                    Operand.ONE,
                    symbolList[Operand.ONE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.TWO,
                    symbolList[Operand.TWO],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.THREE,
                    symbolList[Operand.THREE],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.ADD,
                    symbolList[Operator.ADD],
                    tapHandler,
                  ),
                ],
              ),
              Row(
                children: [
                  StandardWidget(
                    Operator.PLUS_OR_MINUS,
                    symbolList[Operator.PLUS_OR_MINUS],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.ZERO,
                    symbolList[Operand.ZERO],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operand.DOT,
                    symbolList[Operand.DOT],
                    tapHandler,
                  ),
                  StandardWidget(
                    Operator.EQUAL,
                    symbolList[Operator.EQUAL],
                    tapHandler,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
