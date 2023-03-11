import 'package:dart/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

List todo_lists = [
  {"task": "Exercise", "is_done": true},
  {"task": "Reading", "is_done": false},
  {"task": "Checking Phone", "is_done": true},
  {"task": "Youtube", "is_done": false}
];

List search_lists = todo_lists;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var task_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo List App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Search(),
            // search
            Center(
              child: SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    onChanged: (value) {
                      value = value.toLowerCase().trim();
                      search_lists = todo_lists
                          .where((element) => element['task'].toLowerCase().contains(value))
                          .toList();
                          setState(() {
                            
                          });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        hintText: "Serach Your Lists",
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
           
            // search
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
            // adding task
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: task_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        hintText: "Add Tasks",
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65 / 2),
                      color: Colors.red,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 65,
                    height: 65,
                    child: IconButton(
                        onPressed: () {
                          var value = task_controller.text;
                          todo_lists
                              .add({"task": value, "is_done": false});
                          search_lists = todo_lists;
                          setState(() {});
                        },
                        icon: Text(
                          "+",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          // adding task
          ],
        ));
  }
}

// class AddToList extends StatefulWidget {
//   @override
//   State<AddToList> createState() => _AddToListState();
// }

// class _AddToListState extends State<AddToList> {

//   @override
//   Widget build(BuildContext context) {
//   var task_controller = TextEditingController();
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: task_controller,
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
//                 hintText: "Add Tasks",
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(65 / 2),
//               color: Colors.red,
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             width: 65,
//             height: 65,
//             child: IconButton(
//                 onPressed: () {
//                   var value = task_controller.text;
//                   todo_lists.add({"id" : id, "task" : value, "is_done": false });

//                 },
//                 icon: Text(
//                   "+",
//                   style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var toogle_check_box = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: search_lists.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  "${search_lists[search_lists.length - 1 - index]['task']}",
                  style: TextStyle(
                    decoration: (search_lists[search_lists.length - 1 - index]
                                ['is_done'] ==
                            true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
                  ),
                ),
                leading: IconButton(
                    onPressed: () {
                      if (search_lists[search_lists.length - 1 - index]
                              ["is_done"] ==
                          true) {
                        search_lists[search_lists.length - 1 - index]
                            ["is_done"] = false;
                      } else {
                        search_lists[search_lists.length - 1 - index]
                            ["is_done"] = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(search_lists[search_lists.length - 1 - index]
                                ['is_done'] ==
                            true
                        ? Icons.check_box
                        : Icons.check_box_outline_blank)),
                trailing: IconButton(
                    onPressed: () {
                      search_lists.removeAt(search_lists.length - 1 - index);
                      setState(() {});
                    },
                    icon: Icon(Icons.delete)),
              ));
        },
      ),
    );
  }
}

// class Search extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: 300,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: TextField(
//             onChanged: (value){
//               search_lists = todo_lists.where((element) => element['task'].contains(value)).toList();
              
//             },
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
//                 hintText: "Serach Your Lists",
//                 suffixIcon: Icon(Icons.search)),
//           ),
//         ),
//       ),
//     );
//   }
// }
