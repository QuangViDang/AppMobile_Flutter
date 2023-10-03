import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter App'),
    );
  }
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: Colors.black87,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [];

  void addNewItem() async {
    final newItem = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Item name',
            ),
            onSubmitted: (value) {
              Navigator.of(context).pop(value);
            },
          ),
          actions: <Widget>[
            TextButton(
              style: flatButtonStyle,
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: flatButtonStyle,
              child: Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    if (newItem != null) {
      setState(() {
        items.add(newItem);
      });
    }
  }

  void editItem(String item, int index) async {
    final editedItem = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String editedName = item;

        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Item name',
            ),
            controller: TextEditingController(text: item),
            onChanged: (value) {
              editedName = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              style: flatButtonStyle,
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: flatButtonStyle,
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(editedName);
              },
            ),
          ],
        );
      },
    );

    if (editedItem != null) {
      setState(() {
        items[index] = editedItem;
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(
            title: Text("Title"),
            onTap: () {
              editItem(item, index);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
