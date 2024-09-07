import 'package:flutter/material.dart';
import 'controller/item_controller.dart';
import 'models/item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVC Interactive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ItemController _controller = ItemController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Item'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter item name',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _controller.addItem(_textController.text);
                _textController.clear();
              });
            },
            child: Text('Add Item'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controller.getItems().length,
              itemBuilder: (context, index) {
                Item item = _controller.getItems()[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _controller.removeItem(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
