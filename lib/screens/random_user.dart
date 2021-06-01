import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomUser extends StatefulWidget {
  @override
  _RandomUserState createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {
  String result = '';
  bool isLoading = false;
  List users = [];

  Future<void> getRandomUsers() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse('https://randomuser.me/api/?results=100&gender=female');
    var response = await http.get(url);
    setState(() {
      result = json.decode(response.body)['results'].toString();
      users = json.decode(response.body)['results'];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: getRandomUsers,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : result == ''
                ? Text('My Users')
                : GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: users.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlipCard(
                              direction: FlipDirection.VERTICAL,
                              front: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 125,
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              '${users[index]['picture']['large']}'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${users[index]['name']['title']}. ${users[index]['name']['first']}',
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '${users[index]['name']['last']} ',
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${users[index]['dob']['age']} ',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                  // Text(
                                  //   '${users[index]['cell']}',
                                  //   softWrap: true,
                                  //   textAlign: TextAlign.center,
                                  // ),
                                  Text(
                                    '${users[index]['location']['country']}',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              back: Center(
                                  child: Text(
                                '${users[index]['login']['sha256']}',
                                softWrap: true,
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        ),
                      );
                    }),
      ),
    );
  }
}
