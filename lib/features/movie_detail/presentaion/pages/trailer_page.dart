// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Homepage
class TrailerPage extends StatefulWidget {
  final List<String> videoUrl;
  const TrailerPage({super.key, required this.videoUrl});
  @override
  _TrailerPageState createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  List<String>? _ids;

  @override
  void initState() {
    super.initState();
    _ids = widget.videoUrl;
    _controller = YoutubePlayerController(
      initialVideoId: _ids!.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () async {
        await Future.delayed(const Duration(seconds: 4), () {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          Navigator.pop(context);
        });
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              if (_ids!.indexOf(_controller.metadata.videoId) ==
                  _ids!.length - 1) {
                SystemChrome.setPreferredOrientations(
                    [DeviceOrientation.portraitUp]);
                Navigator.pop(context);
              } else {
                _controller.load(_ids![
                    (_ids!.indexOf(_controller.metadata.videoId) + 1) %
                        _ids!.length]);
              }
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          if (data.videoId == _ids!.last) {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
            Navigator.pop(context);
          } else {
            _controller
                .load(_ids![(_ids!.indexOf(data.videoId) + 1) % _ids!.length]);
            _showSnackBar('Next Video Started!');
          }
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          // ),
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
          actions: [],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
