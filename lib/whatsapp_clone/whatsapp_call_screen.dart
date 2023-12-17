import 'package:flutter/material.dart';

class whatsApp_Calls extends StatefulWidget {
  const whatsApp_Calls({super.key});

  @override
  State<whatsApp_Calls> createState() => _whatsApp_CallsState();
}

class _whatsApp_CallsState extends State<whatsApp_Calls> {


  var nimages=[
    "https://www.itl.cat/pngfile/big/38-380429_best-whatsapp-dp-images-friends-icon-group-whatsapp.jpg",
    "https://library.sportingnews.com/styles/crop_style_16_9_mobile_2x/s3/2022-12/Lionel%20Messi%20Argentina%20World%20Cup%20trophy%20121822.jpg?h=920929c4&itok=BJUqskI7"
  ];

  var username=[
    "Albert",
    "Alwin"
  ];
  
  var calltime=[
    "November 1, 8.45 PM",
    "October 8, 5.23 PM",
  ];
  
  var callicons=[
    Icons.call,
    Icons.videocam
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
        itemCount: nimages.length,
        itemBuilder: (context,index){
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(nimages[index]),),
          title: Text(username[index]),
          subtitle: Text(calltime[index]),
          trailing: Icon(callicons[index],color: Colors.teal,),
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
    child: Icon(Icons.add_call),
    ),
    ),
    );
  }
}
