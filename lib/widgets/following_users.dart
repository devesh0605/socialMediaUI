import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';

class FollowingUsers extends StatefulWidget {
  @override
  _FollowingUsersState createState() => _FollowingUsersState();
}

class _FollowingUsersState extends State<FollowingUsers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 80,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10.0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: Theme.of(context).primaryColor),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image(
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    image: AssetImage(users[index].profileImageUrl),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
