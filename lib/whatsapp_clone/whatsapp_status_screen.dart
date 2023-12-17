import 'package:flutter/material.dart';

class whatsApp_Status extends StatefulWidget {
  const whatsApp_Status({super.key});

  @override
  State<whatsApp_Status> createState() => _whatsApp_StatusState();
}

class _whatsApp_StatusState extends State<whatsApp_Status> {


  var statususer=[
    "Arun",
    "Kasi",
    "Akash"
  ];


  var statustime=[
    "7.40 AM",
    "7.10 AM",
    "6.50 AM"
  ];
  var statusimg=[
    "https://www.itl.cat/pngfile/big/38-380429_best-whatsapp-dp-images-friends-icon-group-whatsapp.jpg",
    "https://library.sportingnews.com/styles/crop_style_16_9_mobile_2x/s3/2022-12/Lionel%20Messi%20Argentina%20World%20Cup%20trophy%20121822.jpg?h=920929c4&itok=BJUqskI7",
    "https://www.dailyexcelsior.com/wp-content/uploads/2019/07/Dhoni-1.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: statususer.length,
            itemBuilder: (context,index){
          return Card(
            child: ListTile(
                title: Text(statususer[index]),
                subtitle: Text(statustime[index]),

                leading: CircleAvatar(
                  backgroundImage: NetworkImage(statusimg[index]),
                ),
            ),
          );
        }),
      ),


      floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(backgroundColor: Colors.grey,
              onPressed: (){},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              mini: true,
              child: Icon(Icons.edit)),


          SizedBox(height: 15,),
          FloatingActionButton(backgroundColor: Colors.teal,
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            mini: true,
            elevation: 2.0,
            child: Icon(Icons.photo_camera),),

        ],
      ),

    );
  }
}

