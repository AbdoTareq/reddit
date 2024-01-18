import 'package:chewie/chewie.dart';
import 'package:reddit/core/color_manager.dart';
import 'package:video_player/video_player.dart';

import '../../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.searchController,
  }) : super(key: key);

  final SearchController? searchController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: title.text.xl.white.bold.make(),
          leading: Icon(Icons.arrow_back, color: Colors.white),
          backgroundColor: ColorManager.black,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chewie(
              controller: ChewieController(
                  videoPlayerController: VideoPlayerController.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')),
            ).h(.2.sh),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(1.sh);
}
