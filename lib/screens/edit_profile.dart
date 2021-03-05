import 'package:b1/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Edit Profile"),
      ),
      body: Container(
        child: Consumer<AuthController>(
          builder: (context, controller, child) => Stack(
            children: [
              Positioned(
                top: 50,
                left: 80,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent,
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 240,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await controller.pickImage();
                    },
                  ),
                ),
              ),
              Positioned(
                top: 280,
                left: 30,
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 30,
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        hintText: "Contact",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 420,
                left: 30,
                child: Container(
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.home_outlined,
                        ),
                        hintText: "Address",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 560,
                left: 105,
                child: InkWell(
                  child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: "Update".text.white.bold.size(20).make())),
                  onTap: () async {
                    // await controller.updateProfile(name: name.userId);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
