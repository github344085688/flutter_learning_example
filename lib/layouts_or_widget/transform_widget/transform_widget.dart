import 'package:flutter/material.dart';
import 'package:flutter_learning_example/common/widget_markdown.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({Key key}) : super(key: key);

  @override
  _TransformWidget createState() => _TransformWidget();
}

class _TransformWidget extends State<TransformWidget> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: """DROPDOMNBUTTON"""),
            ],
          ),
        ),
      );
}
