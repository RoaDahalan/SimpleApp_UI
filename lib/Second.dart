import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  List<String> items = [];

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      items = prefs.getStringList('items') ?? [];
    });
  }
  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('items', items);
  }

  _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        items.add(_controller.text);
        _controller.clear();
      });
      _saveData();
    }
  }

  _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 36,),
          Text("Work numbers" , style: TextStyle(fontSize: 30 , color: Colors.orange),),
          Padding(
            padding: const EdgeInsets.only(top: 40 , bottom: 25 , left: 20 , right: 20),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Add a work number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addItem,
            child: Text("Add"),
          ),

          SizedBox(height: 16,),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(items[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteItem(index),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Colors.orange ,
                            width: 2
                        )
                    ),
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
