import 'package:flutter/material.dart';

class whatsApp_Chats extends StatefulWidget {
  const whatsApp_Chats({super.key});

  @override
  State<whatsApp_Chats> createState() => _whatsApp_ChatsState();
}

class _whatsApp_ChatsState extends State<whatsApp_Chats> {




  var nimages=[
    "https://www.attitudestatus.org/wp-content/uploads/2020/07/dp-image-79-scaled.jpg",
    "https://ik.imagekit.io/lqqahbj0pe/wp-content/uploads/2020/12/antecedent-unknown-person.jpg",
  ];

  var username=[
    "Albert",
    "Alwin"
  ];

  var mymsg=[
    "Hi",
    "Morning"
  ];

  var msgtime=[
    "10:34 PM",
    "10:25 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: nimages.length,
          itemBuilder: (context,index){
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(nimages[index]),),
          title: Text(username[index]),
          subtitle: Text(mymsg[index]),
          trailing: (
          Text(msgtime[index])
          ),
        );
      }),
      floatingActionButton:FloatingActionButton(backgroundColor: Colors.teal,
      onPressed: (){},
      shape:
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
          mini: true,
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.message),
          ),),
    );
  }
}
