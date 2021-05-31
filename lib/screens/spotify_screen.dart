import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:social_media_ui/widgets/player.dart';

class SpotifyData extends StatefulWidget {
  @override
  _SpotifyDataState createState() => _SpotifyDataState();
}

class _SpotifyDataState extends State<SpotifyData> {
  AudioPlayer audioPlayer = AudioPlayer();

  List<Widget> elementData = [];
  bool isLoading = false;
  bool playState = false;
  var result = 'Nothing';
  String audioUrl = '';

  Widget player(String urlAudio) {
    return FlatButton(
        color: Colors.blue,
        onPressed: () async {
          playState
              ? await audioPlayer.pause()
              : await audioPlayer.play(urlAudio);
          setState(() {
            playState = !playState;
          });
          print(urlAudio);
        },
        child: playState ? Text('Pause') : Text('Play'));
  }

  Future<void> getArtistData() async {
    setState(() {
      isLoading = true;
    });
    var url =
        Uri.parse('https://itunes.apple.com/search?term=rain of castamere');
    var response = await http.get(url);
    print(json.decode(response.body)['results'][0].runtimeType);

    setState(() {
      isLoading = false;
      //result = json.decode(response.body)['results'][0].toString();
      json.decode(response.body)['results'][0].forEach((k, v) {
        if (k.toString() == 'previewUrl') {
          setState(() {
            audioUrl = v.toString();
          });
        }
        //print("Key : $k, Value : $v");
        elementData.add(Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$k :-'),
            if (v.toString().endsWith('jpg'))
              Image(
                image: NetworkImage('$v'),
              )
            else if (k.toString() == 'previewUrl')
              CustomPlayer(
                urlAudio: v.toString(),
              )
            else
              Text('$v'),
            SizedBox(
              height: 10,
            )
          ],
        ));
      });
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
        child: isLoading
            ? CircularProgressIndicator()
            : elementData.isEmpty
                ? Text('No data yet')
                : ListView(
                    children: elementData,
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: getArtistData,
      ),
    );
  }
}
