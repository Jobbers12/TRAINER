import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  AudioCache audioCache = AudioCache(prefix: 'audio/');

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('PLAY SOUND'),
      onPressed: () {
        audioCache.play('99.mp3', mode: PlayerMode.LOW_LATENCY);
      },
    );
  }
}

// await Future.delayed(Duration(seconds: 10))

// setState
// aewait time 
// setstate
