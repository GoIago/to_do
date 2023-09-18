import 'package:flutter/material.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/widgets/todo_items.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color for background of the whole app, not top bar
      backgroundColor: Color.fromARGB(255, 245, 235, 235),
      //da Following> app top bar color
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 235, 235),
        elevation: 0,
        title:
            //following> allign image on right side
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // following> this is the burgermenu icon
          Icon(
            Icons.menu,
            color: Color.fromARGB(234, 80, 153, 31),
            size: 30,
          ),
          //Following> this is the container for the profile image and the call to the image
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar.JPG')),
          )
        ]),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBar(),
                Expanded(
                  //container widget for the following
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All To do',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _habdkeTiDiChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ) //set a container for the searchbar wirget so that you can keep the main code cleaner
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'New reminder', border: InputBorder.none),
                  ),
                )),
                Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: (40)),
                      ),
                      onPressed: () {
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Color.fromARGB(0, 44, 44, 225),
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _habdkeTiDiChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {});
    todosList.removeWhere((item) => item.id == id);
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList
          .add(ToDo(id: DateTime.now().millisecond.toString(), todoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Container searchBar() {
    //the searchbar container
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 20,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                maxWidth: 25,
              ),
              border: InputBorder.none,
              hintText: 'search',
              hintStyle: TextStyle(color: Colors.grey))),
    );
  }
}
