import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

var todo_lists = [
  {"id" : 1, "task" : "Exercise"},
  {"id" : 2, "task" : "Reading"},
  {"id" : 3, "task" : "Checking Phone"},
  {"id" : 3, "task" : "Checking Phone"}

];

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo List App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Search(),
            SizedBox(
              height: 20,
            ),
            Text(
              "My Lists",
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            MyList(),
            // AddToList(),
          ],
        ));
  }
}


class AddToList extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                hintText: "Add Tasks",
                
                ),
          ),
      ],
    );
  }
}

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var icon_check_box = Icons.check_box_outline_blank;
  var toogle_check_box = true;
  @override
  Widget build(BuildContext context) {
        return Expanded(
          child: ListView.builder(
            itemCount: todo_lists.length,
            itemBuilder:(context, index) {
              return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text("${todo_lists[index]['task']}"),
                leading: IconButton(
                    onPressed: () {
                      toogle_check_box = !toogle_check_box;
                    }, icon: Icon(toogle_check_box ? Icons.check_box_outline_blank : Icons.check_box)),
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ));
            },
            
            ),
        );
      }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                hintText: "Serach Your Lists",
                suffixIcon: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}
