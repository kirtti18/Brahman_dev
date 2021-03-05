import 'package:b1/screens/edit_profile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("Pradeep Kumar Nayak",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ))
            ],
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfile(),
            ),
          );
        },
        leading: Icon(Icons.person),
        title: Text("Edit Profile"),
        trailing: Icon(Icons.edit),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(Icons.help),
        title: Text("Contact us"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(Icons.help),
        title: Text("help"),
      ),
      ListTile(
        onTap: () {
          // Navigator.pushReplacementNamed(context, Login);
        },
        leading: Icon(Icons.logout),
        title: Text('Log Out'),
      )
    ]);
  }
}
