import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new , size: 30, color: Colors.white,)),
      ),
      backgroundColor: Colors.blue[800],
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("_lang".tr() , style: TextStyle(fontSize: 30 , color: Colors.white),),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.language,
                    size: 30,
                    color: Colors.white,
                  ),
                  onSelected: (String value) {
                    if (value == 'en') {
                      context.setLocale(Locale('en'));
                    } else {
                      context.setLocale(Locale('ar'));
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'en',
                        child: Center(child: Text("English")),
                      ),
                      PopupMenuItem<String>(
                        value: 'ar',
                        child: Center(child: Text("Arabic")),
                      ),
                    ];
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
