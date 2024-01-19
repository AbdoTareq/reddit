import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/comment_actions.dart';
import 'package:reddit/models/comment_model.dart';

class Comment extends StatelessWidget {
  const Comment(
    this.comment, {
    super.key,
  });
  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Stack(
                children: [
                  Image.asset(comment.userImage),
                  if (comment.isUserOnline)
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: VxCircle(
                            backgroundColor: ColorManager.green, radius: 10)),
                ],
              ).w(35.w),
              title: comment.user.text.xl.make().pOnly(top: 12.h),
            ),
            comment.content.text.bold.xl.make().px20(),
            CommentActions(comment),
          ],
        ).py12().card.color(ColorManager.betterDarkGrey).make(),
        // Display replies recursively
        if (comment.children.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(width: 1.0, color: ColorManager.grey)),
            ),
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  comment.children.map((reply) => Comment(reply)).toList(),
            ),
          ),
      ],
    );
  }
}
