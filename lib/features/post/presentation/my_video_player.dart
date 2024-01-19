import 'package:chewie/chewie.dart';
import 'package:reddit/export.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatelessWidget {
  const MyVideoPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Chewie(
        controller: ChewieController(
          aspectRatio: 16 / 7,
          videoPlayerController: VideoPlayerController.network(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
        ),
      ),
    ).px8().pOnly(bottom: 20);
  }
}
