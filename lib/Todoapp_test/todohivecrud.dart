import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


void main()async{
  await Hive.initFlutter();
  await Hive.openBox("to_do_Box");
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    home: TodoappHome(),));
}

class TodoappHome extends StatefulWidget {
  const TodoappHome({super.key});

  @override
  State<TodoappHome> createState() => _TodoappHomeState();
}

class _TodoappHomeState extends State<TodoappHome> {


  List<Map<String,dynamic>> todotask= [];
  final mybox=Hive.box("to_do_Box");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.red,
      title: Center(
          child: Text("To Do")),
    ),
      body:
      todotask.isEmpty?
      Center(
        child: Image(
          image: NetworkImage("https://cdn.dribbble.com/users/2330950/screenshots/6128967/59_4x.jpg"),
        ),
      )
          :ListView.builder(
          itemCount: todotask.length,
          itemBuilder: (ctx,index){

            final mytask=todotask[index];

            return Card(
              child: ListTile(
                title: Text(todotask[index]["taskname"]),
                subtitle: Text(mytask["taskcont"]),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      showTask(context, mytask['id']);
                    }, icon: Icon(Icons.edit,color: Colors.green,)),
                    IconButton(onPressed: (){
                      deleteTask(mytask['id']);
                    }, icon: Icon(Icons.delete,color: Colors.red,))
                  ],
                ),
              ),
            );
          }),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple.shade900,
          onPressed: ()=>showTask(context,null),
          child: Icon(Icons.add),
        ),
    );
  }


  final mytask_controller=TextEditingController();
  final mycontent_controller=TextEditingController();

  void showTask(BuildContext context, int? itemkey) {
    if(itemkey!=null){
      final existingTask= todotask.firstWhere((element) => element['id']==itemkey);
      mytask_controller.text=existingTask['taskname'];
      mycontent_controller.text=existingTask['taskcont'];
    }

    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (context){
      return Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom+120
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: mytask_controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: "Title"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: mycontent_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description"
              ),
            ),
            SizedBox(height: 15,),

            ElevatedButton(onPressed: (){
              if(mytask_controller.text!=""&& mycontent_controller.text!=""){
                if(itemkey==null){
                  createTask({
                    "heading":mytask_controller.text.trim(),
                    "content":mycontent_controller.text.trim(),
                  });
                }else{
                  updateTask(itemkey,{
                    "heading":mytask_controller.text.trim(),
                    "content":mycontent_controller.text.trim()
                  });
                }
              }
              mytask_controller.text="";
              mycontent_controller.text="";
              Navigator.of(context).pop();
            },
                style: ElevatedButton.styleFrom(backgroundColor:Colors.green),


                child: Text(itemkey==null? "Save Task" : "Update Task"))
          ],
        ),
      );
    });
  }


  Future<void>createTask(Map<String, dynamic> task) async {
    await mybox.add(task);
    load_or_read_Task();

  }


  void load_or_read_Task() {
    final task_from_hive=mybox.keys.map((key) {
      final value = mybox.get(key);
      return {
        "id": key,
        "taskname": value["heading"],
        "taskcont": value["content"]
      };
    }).toList();
    setState(() {
      todotask=task_from_hive.reversed.toList();
    });
  }
  
  Future<void> deleteTask(int itemkey) async{
    await mybox.delete(itemkey);
    load_or_read_Task();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Task Deleted Successfully")));
  }

  void updateTask(int? itemkey, Map<String, String> uptask) async{
    await mybox.put(itemkey, uptask);
    load_or_read_Task();
  }

}
