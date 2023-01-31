import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'global.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  late String abc;

  Future<void> loadVideoPlayer() async {
    _controller = VideoPlayerController.network(Global.AllData['video'])
      // _controller.addListener(() {
      //   setState(() {});
      // });
      ..initialize().then((value) {
        setState(() {});

        chewieController = ChewieController(
            videoPlayerController: _controller, autoPlay: false,
        );
      });
  }

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map alltransfer = ModalRoute.of(context)!.settings.arguments as Map;
    abc = alltransfer['video'];

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      appBar: AppBar(
        title: Text(
          "${alltransfer['text']}",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 650,
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: chewieController != null
                    ? Chewie(
                        controller: chewieController,
                      )
                    : Container(),
              ),
            ),

            // Container( //duration of video
            //   child: Text("Total Duration: " + _controller.value.duration.toString()),
            // ),
            //
            // Container(
            //     child: VideoProgressIndicator(
            //         _controller,
            //         allowScrubbing: true,
            //         colors:VideoProgressColors(
            //           backgroundColor: Colors.redAccent,
            //           playedColor: Colors.green,
            //           bufferedColor: Colors.purple,
            //         )
            //     )
            // ),
            //
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       IconButton(
            //           onPressed: (){
            //             if(_controller.value.isPlaying){
            //               _controller.pause();
            //             }else{
            //               _controller.play();
            //             }
            //
            //             setState(() {
            //
            //             });
            //           },
            //           icon:Icon(_controller.value.isPlaying?Icons.pause:Icons.play_arrow)
            //       ),
            //
            //       IconButton(
            //           onPressed: (){
            //             _controller.seekTo(Duration(seconds: 0));
            //
            //             setState(() {
            //
            //             });
            //           },
            //           icon:Icon(Icons.stop)
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
