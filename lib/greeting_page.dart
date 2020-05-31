import 'package:flutter/material.dart';
import 'package:fluttertestapp/greeting.dart';

class GreetingPage extends StatefulWidget {
  @override
  _GreetingPageState createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  var _greeting = Greeting();
  String _name;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('挨拶ページ'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: '名前',
              ),
              key: const Key('name text field'),
            ),
            Text(
              _greeting.greeting(_name),
              key: const Key('greeting text'),
            ),
            RaisedButton(
              child: Text('挨拶をする'),
              onPressed: () {
                setState(() {
                  _name = _textEditingController.text;
                });
              },
              key: const Key('greeting button'),
            ),
          ],
        ),
      ),
    );
  }
}
