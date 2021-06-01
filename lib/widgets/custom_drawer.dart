import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image(
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      currentUser.backgroundImageUrl,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                currentUser.profileImageUrl,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          currentUser.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            letterSpacing: 1.5,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return HomeScreen();
                  // }));
                },
              ),
              ListTile(
                leading: Icon(Icons.chat_sharp),
                title: Text('Chats'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return HomeScreen();
                  // }));
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Map'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return HomeScreen();
                  // }));
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Your Profile'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return HomeScreen();
                  // }));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return HomeScreen();
                  // }));
                },
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
