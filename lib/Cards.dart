import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project5/Profile.dart';
import 'package:project5/Contacts.dart';
import 'package:project5/Language.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  // صفحات العرض المرتبطة بكل عنصر
  final List<Widget> pages = [Page0(), Page1(), Page2()];

  // دالة للانتقال إلى الصفحة المختارة بناءً على index
  void navigateToPage(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // قائمة لتخزين العناوين والايقونات
    List<Map<String, dynamic>> items = [
      {"title": "_profile".tr(), "icon": Icons.person},
      {"title": "_contacts".tr(), "icon": Icons.contacts_outlined},
      {"title": "_language".tr(), "icon": Icons.language},
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95,
        backgroundColor: Colors.blue[800],
        title: Text(
          "_welcome".tr(),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          items[index]["icon"],
                          size: 40,
                          color: Colors.blue[800],
                        ),
                        onPressed: () {
                          navigateToPage(context, index);
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        items[index]["title"], // نص مترجم بناءً على اللغة
                        style: TextStyle(fontSize: 25, color: Colors.blue[800]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

