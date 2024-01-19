import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/ch_bottom_sheet.dart';
import 'package:reddit/models/comment_model.dart';

class CommentActions extends StatefulWidget {
  const CommentActions(
    this.comment, {
    super.key,
  });
  final CommentModel comment;

  @override
  State<CommentActions> createState() => _CommentActionsState();
}

class _CommentActionsState extends State<CommentActions> {
  late int votes;
  @override
  void initState() {
    votes = widget.comment.votes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        '...'
            .text
            .bold
            .xl
            .color(ColorManager.white38)
            .make()
            .pOnly(bottom: 8)
            .onTap(() {
          showBottomSheet(
              context: context, builder: (x) => ChBottomSheet(widget.comment));
        }),
        10.w.widthBox,
        IconButton(
          color: ColorManager.white38,
          onPressed: () {},
          icon: Icon(Icons.reply, size: 28.w),
        ),
        'Reply'.text.xl.color(ColorManager.white38).make(),
        12.w.widthBox,
        IconButton(
          color: ColorManager.white38,
          onPressed: () {
            votes = widget.comment.votes + 1;
            setState(() {});
          },
          icon: Icon(
            Icons.upload_outlined,
            size: 28.w,
            color: votes > widget.comment.votes
                ? ColorManager.red
                : ColorManager.white38,
          ),
        ),
        6.w.widthBox,
        votes.text.bold.color(ColorManager.white38).make(),
        IconButton(
          color: ColorManager.white38,
          onPressed: () {
            votes = widget.comment.votes - 1;
            setState(() {});
          },
          icon: Icon(
            Icons.download_outlined,
            size: 28.w,
            color: votes < widget.comment.votes
                ? ColorManager.purple
                : ColorManager.white38,
          ),
        ),
      ],
    );
  }
}
