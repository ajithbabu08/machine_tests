import 'package:flutter/material.dart';
import 'package:machine_test/whatsapp_clone/whatsapp_call_screen.dart';
import 'package:machine_test/whatsapp_clone/whatsapp_chat_screen.dart';
import 'package:machine_test/whatsapp_clone/whatsapp_status_screen.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
    home: whatsApp_Tab(),));
}


class whatsApp_Tab extends StatefulWidget {
  const whatsApp_Tab({super.key});

  @override
  State<whatsApp_Tab> createState() => _whatsApp_TabState();
}

class _whatsApp_TabState extends State<whatsApp_Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.teal,
          title: Text("WhatsApp"),
          actions: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 12,),
            Icon(Icons.search_rounded),
            SizedBox(width: 12,),

           PopupMenuButton(itemBuilder: (context){
             return[
               PopupMenuItem(child: Text("New group")),
               PopupMenuItem(child: Text("New broadcast")),
               PopupMenuItem(child: Text("Linked devices")),
               PopupMenuItem(child: Text("Starred messages")),
               PopupMenuItem(child: Text("Payments")),
               PopupMenuItem(child: Text("Settings")),
             ];
           }),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.zero,
            tabs: [

              SizedBox(
                  width: MediaQuery.of(context).size.width*3,
                  child: Center(child: Text("Chats"))),

              SizedBox(
                  width: MediaQuery.of(context).size.width*3,
                  child: Center(child: Text("Status"))),
              SizedBox(
                  width: MediaQuery.of(context).size.width*3,
                  child: Center(child: Text("Calls")))
            ],
          ),
        ),

        body: TabBarView(
          children: [
            whatsApp_Chats(),
            whatsApp_Status(),
            whatsApp_Calls(),
          ],
        ),
      ),
    );
  }
}
