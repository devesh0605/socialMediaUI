import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CustomPlayer extends StatefulWidget {
  final String urlAudio;
  CustomPlayer({this.urlAudio});
  @override
  _CustomPlayerState createState() => _CustomPlayerState();
}

class _CustomPlayerState extends State<CustomPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool playState = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.blue,
        onPressed: () async {
          playState
              ? await audioPlayer.pause()
              : await audioPlayer.play(widget.urlAudio);
          setState(() {
            playState = !playState;
          });
          //print(widget.urlAudio);
        },
        child: playState ? Text('Pause') : Text('Play'));
  }
}
