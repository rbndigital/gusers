import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gusers/widgets/User.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List userData;

  List<Widget> actionsAppBar() {
    return <Widget>[
      IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
      IconButton(icon: Icon(Icons.save_alt), onPressed: () {}),
      IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
    ];
  }

  Drawer menuDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Center(child: Text('Opciones del Usuario'))),
          ListTile(title: Text('Opcion 1')),
          ListTile(title: Text('Opcion 2')),
          ListTile(title: Text('Opcion 3')),
        ],
      ),
    );
  }

  Future getData() async {
    http.Response response =
        await http.get('https://reqres.in/api/users?page=2');

    data = jsonDecode(response.body);

    setState(() {
      userData = data['data'];
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    var body = Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5.0)]),
            child: Center(
                child: Text('Gestor de Usuarios',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900))),
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (BuildContext context, int index) {
              return User(userData: userData, index: index);
            },
          ),
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(
            title: Text('G Users'),
            backgroundColor: Colors.red,
            actions: actionsAppBar()),
        drawer: menuDrawer(),
        body: userData == null
            ? Center(child: CircularProgressIndicator())
            : body);
  }
}
