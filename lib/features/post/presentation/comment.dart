import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/comment_actions.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Stack(
            children: [
              Image.asset('assets/images/logo.png'),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: VxCircle(
                      backgroundColor: ColorManager.green, radius: 10)),
            ],
          ).w(35.w),
          title: 'Practical-Stay-9674 • Now'.text.xl.make().pOnly(top: 12.h),
        ),
        'Amazing'.text.bold.xl.make().px20(),
        CommentActions(),
      ],
    ).py12().card.color(ColorManager.betterDarkGrey).make();
  }
}
