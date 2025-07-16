import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project5/First.dart';
import 'package:project5/Second.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:
    Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(Icons.arrow_back_ios_new , size: 30, color: Colors.white,)),
        backgroundColor: Colors.blue[800],
        bottom: TabBar(
          labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 16),
            tabs: [
          Tab(icon: Icon(Icons.private_connectivity , size: 39,), text: "_private".tr(),),
          Tab(icon: Icon(Icons.work , size: 35,), text: "_work".tr(),),
        ]),
      ),

      body: TabBarView(children: [
        First(),
        Second(),
      ]),

    )
    );
  }
}
