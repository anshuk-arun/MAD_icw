import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

/*
  Current working on:
  Implement Firebase for State Management
  - Integrate Firebase for Backend data storage
  - firebase is updated in realtime as use the app
  - implement firbase auth to secure app and identify users
*/
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const TaskListApp());
}

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CW6 - Firebase List of Tasks, CRUD',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: TaskListScreen(title: 'CW6 - List of Tasks, CRUD'),
    );
  }
}

// Stateful Widget to manage the state of the Task List
class TaskListScreen extends StatefulWidget {

  const TaskListScreen({
    super.key,
    required this.title,
    this.color = Colors.lightGreenAccent,
    this.child,
  });

  final String title;
  final Color color;
  final Widget? child;

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();

}

// Task Class for holding the name and completionStatus
class Task {
  // Task Instance. The name is required when creating it. The CompletionStatus is default False.
  Task({
    required this.name,
    this.completionStatus = false,
  });

  // final taskDate = {
  //   "name" : "",
  //   "completionStatus" : false,
  // };

  String name;
  bool completionStatus;
}

class _TaskListScreenState extends State<TaskListScreen>{


  // Firestore Database
  final db = FirebaseFirestore.instance;

  // List to hold all the Tasks
  final List<Task> _tasks = [];
  // text controller for textfield
  final TextEditingController _controller = TextEditingController();

  String fieldInput = "";

  
  // Add a new Task
  void addTask(){
    setState(() {
      // the new task has the name of what's in the textField
      _tasks.add(Task(name: _controller.text, completionStatus: false));

      // Firebase add
      final taskData = {
        "name" : _controller.text,
        "completionStatus": false,
      };
      db.collection("_db-tasks").doc(_controller.text).set(taskData);
      //db.collection("_db-tasks").doc("Tasks").set(taskData).onError((e, _) => print("error writing document: $e"));    
    });
  }

  // Delete the selected Task
  void deleteTask(int index){
    setState(() {
      _tasks.removeAt(index);
    });
  }

  // Complete the selected Task
  void completeTask(int index){
    setState(() {
      // toggle the completion / not completion of a task
      _tasks.elementAt(index).completionStatus = !(_tasks.elementAt(index).completionStatus);

      // bool csBool;
      // // update the completion status
      // final statusRef = db.collection("_db-tasks").doc(_tasks.elementAt(index).name);
      // statusRef.get().then(
      //   (DocumentSnapshot doc) {
      //     final data = doc.data() as Map<String, bool>;

      //   }
      // )
      // csInstance.update({"completionStatus": csInstance.get()})
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // App Bar with Color Scheme and Title
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Title of App
          const Text(
            'CRUD OPERATIONS',
          ),
          
          // Users enter Tasknames
          Expanded(
            child: SizedBox(
              height: 10.0,
              child: TextField(
                // The textField is managed by the TextEditingController
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Task Name",
                ),
                onSubmitted: (value){
                  fieldInput = value;
                },
              ),
            ),
          ),

          // Add Task Button
          ElevatedButton(
            onPressed: addTask,
            child: const Text("Add Task"),
          ),

          //Expanded and SizeBox for restrictions on width/height
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: _tasks.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50,
                  color: Colors.lightGreenAccent,
                  // Task name, Checkmark, Delete Button
                  child: Row(
                    children: [
                      // Task Name
                      Center(child: Text(_tasks.elementAt(index).name.toString())),   // Grabs the name of a Task

                      // Checkmark
                      Checkbox(
                        checkColor: Colors.black,
                        //fillColor: WidgetStateProperty.resolveWith(Colors.blue),
                        value: _tasks.elementAt(index).completionStatus,
                        onChanged: (value) => completeTask(index),
                      ),

                      //Delete Button
                      ElevatedButton(
                        onPressed: () => deleteTask(index),
                        child: const Text("Delete"),
                      ),
                      
                    ],
                  ),
                );
                // What each entry of ListView is

              },
            )
          ),
          // The Listview Widget
          
        ],
      
      ),
     

    );
  }
}


/*
// Display Task List
ListView(
  padding: const EdgeInsets.all(8),
  children: [
    Container(
      height: 50,
      color: Colors.lightGreenAccent,
      // Task name, Checkmark, Delete Button
      child: Row(
        children: [
          // Task Name
          const Center(child: Text('Entry A')),
          // Checkmark
          Checkbox(
            checkColor: Colors.white,
            //fillColor: WidgetStateProperty.resolveWith(Colors.blue),
            value: isChecked,
            onChanged: (bool? value){
              setState(() {
                isChecked = value!;
              });
            },
          ),
          //Delete Button
          ElevatedButton(
            onPressed: deleteTask,
            child: const Text("Delete"),
          ),
        ],
      ),
    ),
    Container(
      height: 50,
      color: Colors.lightGreenAccent,
      // Task name, Checkmark, Delete Button
      child: Row(
        children: [
          // Task Name
          const Center(child: Text('Entry B')),
          // Checkmark
          Checkbox(
            checkColor: Colors.white,
            //fillColor: WidgetStateProperty.resolveWith(Colors.blue),
            value: isChecked,
            onChanged: (bool? value){
              setState(() {
                isChecked = value!;
              });
            },
          ),
          //Delete Button
          ElevatedButton(
            onPressed: deleteTask,
            child: const Text("Delete"),
          ),
        ],
      ),
    ),

  ],
),
*/

