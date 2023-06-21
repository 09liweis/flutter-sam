import 'package:flutter/material.dart';
import 'package:fluttersam/widgets/video.dart';

class TikTokScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TikTok Style'),
      // ),
      body: Center(
        child: TikTokVideo(
          videoUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
          text: 'Hello, TikTok!',
        ),
      ),
    );
  }
}
