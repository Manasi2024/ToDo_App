import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = todoList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(

      backgroundColor: tdBGcolor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text(
                          '  All To Dos ',
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: tdBlack),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding :  EdgeInsets.only(top: 5.0, left: 10, bottom: 5),
                      child: TextField(

                          controller: _todoController,
                          decoration: InputDecoration(hintText: '   Add a new todo item', border: InputBorder.none,
                          ),
                          style:(TextStyle(color: Colors.black))
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(65, 65),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
//  to select and deselect item in todolists
  void _handleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
//  to delete item in todolist
  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }
//  to add new item in list
  void _addToDoItem(String todo) {
    if (todo.isNotEmpty) {
      setState(() {
        todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo,
        ));
      });
      _todoController.clear();
    }
  }
//  to select and deselect item in todolists
  void _runFilter(String enteredkey){
    List<ToDo> results=[];
    // checking for if entered key is whitespace or null
    if(enteredkey.isEmpty){
      results = todoList;
    }else {// chceking for whether key entered is
      results = todoList.where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredkey.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });

  }
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.only(top: 10.0, left: 5, bottom: 5),
          prefixIcon: Icon(
            Icons.search,
            color: tdGrey,
            size: 27,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGcolor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/user_profile.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}