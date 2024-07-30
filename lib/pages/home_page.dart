import 'package:flutter/material.dart';
import 'package:ngdemo_10/services/pref_service.dart';

import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "no name";

  List<User> userList = [
    User(id: 1002, username: 'Foziljon'),
    User(id: 1003, username: 'Dilime')
  ];

  @override
  void initState() {
    super.initState();
    // Prefs.storeName('Jahongir');
    // Prefs.removeName();
    // _loadName();

    // User user = new User(id : 1001, username: 'Islom');
    // Prefs.storeUser(user);
    // _loadUser();


    Prefs.storeUserList(userList);
    _loadUserList();

  }

  _loadUserList()async{
    List<User>? result = await Prefs.loadUserList();
    setState(() {
      name = result!.length.toString();
    });
  }


  _loadUser() async {
    User? user = await Prefs.loadUser();
    setState(() {
      this.name = user!.toMap().toString();
    });
    print(name);
  }




  _loadName() async {
    String name = await Prefs.loadName();
    setState(() {
      this.name = name;
    });
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Shared Prefence'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
