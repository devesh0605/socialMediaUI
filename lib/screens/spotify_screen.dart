import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyData extends StatefulWidget {
  @override
  _SpotifyDataState createState() => _SpotifyDataState();
}

class _SpotifyDataState extends State<SpotifyData> {
  bool isLoading = false;
  var result = 'Nothing';

  Future<void> getArtistData() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('https://itunes.apple.com/search?term=taylor+swift');
    var response = await http.get(url);
    print(json.decode(response.body)['results'].length);
    setState(() {
      isLoading = false;
      result = json.decode(response.body)['results'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spotify'),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading ? CircularProgressIndicator() : Text(result),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: getArtistData,
      ),
    );
  }
}
