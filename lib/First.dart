import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  // قائمة لتخزين الاسم ورقم الجوال كـ Map
  List<Map<String, String>> items = [];

  // Controllers لإدخال الاسم ورقم الجوال
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData(); // تحميل البيانات عند بدء الصفحة
  }

  // تحميل البيانات من SharedPreferences
  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String>? savedItems = prefs.getStringList('private_numbers'); // مفتاح خاص بالصفحة الأولى
      if (savedItems != null) {
        items = savedItems.map((item) {
          var splitItem = item.split(',');
          return {'name': splitItem[0], 'phone': splitItem[1]};
        }).toList();
      }
    });
  }

  // حفظ البيانات في SharedPreferences
  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedItems = items.map((item) => '${item['name']},${item['phone']}').toList();
    prefs.setStringList('private_numbers', savedItems); // حفظ البيانات باستخدام مفتاح خاص بالصفحة الأولى
  }

  // إضافة عنصر جديد
  _addItem() {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      setState(() {
        items.add({
          'name': _nameController.text,
          'phone': _phoneController.text,
        });
        _nameController.clear();
        _phoneController.clear();
      });
      _saveData(); // حفظ البيانات بعد الإضافة
    }
  }

  // حذف عنصر من القائمة
  _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    _saveData(); // حفظ البيانات بعد الحذف
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 36),
          Text(
            "_private".tr(),
            style: TextStyle(fontSize: 30, color: Colors.orange),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 25, left: 20, right: 20),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "_name".tr(),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "_phone".tr(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          ElevatedButton(
            onPressed: _addItem,
            child: Text("_add".tr()),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('${items[index]['name']} - ${items[index]['phone']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteItem(index),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange, width: 2),
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
