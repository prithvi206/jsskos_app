import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.file(sub1!)
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    _controller = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/aikyamind-backend.appspot.com/o/10th%20video.mp4?alt=media&token=ff9e830e-f778-4e94-b509-cc172a591522',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 214, 84, 67),
      ),
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
