import 'package:flutter/material.dart';

class User extends StatelessWidget {
  
  const User({
    Key key,
    @required this.userData,
    @required this.index,
  }) : super(key: key);

  final List userData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(userData[index]['avatar']),
          ),
        ),
        Text("${userData[index]['first_name']} ${userData[index]['last_name']}",style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700
        ))
      ]),
    );
  }
}