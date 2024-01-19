import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/post_cubit.dart';
import 'package:reddit/models/post.dart';

class VideoActions extends StatefulWidget {
  VideoActions(
    this.post,
    this.scrollController, {
    super.key,
  });
  final Post post;
  final ScrollController scrollController;

  @override
  State<VideoActions> createState() => _VideoActionsState();
}

class _VideoActionsState extends State<VideoActions> {
  late int votes;
  @override
  void initState() {
    votes = widget.post.votes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100.h,
      right: 12.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              votes = widget.post.votes + 1;
              setState(() {});
            },
            icon: Icon(
              Icons.upload_outlined,
              size: 30.w,
              color: votes > widget.post.votes
                  ? ColorManager.red
                  : ColorManager.white,
            ),
          ),
          votes.text.bold.xl.make(),
          IconButton(
            onPressed: () {
              votes = widget.post.votes - 1;
              setState(() {});
            },
            icon: Icon(
              Icons.download_outlined,
              size: 30.w,
              color: votes < widget.post.votes
                  ? ColorManager.purple
                  : ColorManager.white,
            ),
          ).pOnly(bottom: 12.h),
          IconButton(
            onPressed: () {
              widget.scrollController.animToBottom();
            },
            icon: Icon(
              Icons.mode_comment_outlined,
              size: 30.w,
            ),
          ),
          widget.post.comments.length
              .toString()
              .text
              .bold
              .xl
              .make()
              .pOnly(bottom: 12.h),
          IconButton(
            onPressed: () => sl<PostCubit>().update(
                widget.post.copyWith(comments: [widget.post.comments.first])),
            icon: Icon(Icons.ios_share_rounded, size: 30.w),
          ),
        ],
      ),
    );
  }
}
