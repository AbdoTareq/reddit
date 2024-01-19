import 'package:chewie/chewie.dart';
import 'package:reddit/export.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatelessWidget {
  const MyVideoPlayer({
    super.key,
    required this.videoId,
  });
  final String videoId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Chewie(
        controller: ChewieController(
          autoPlay: true,
          aspectRatio: 16 / 7,
          videoPlayerController: VideoPlayerController.network(videoId),
        ),
      ),
    ).px8().pOnly(bottom: 20);
  }
}
