import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/post_cubit.dart';
import 'package:reddit/models/comment_model.dart';
import 'package:reddit/models/post.dart';

class CommentSortSheet extends StatelessWidget {
  CommentSortSheet(
    this.post, {
    Key? key,
  }) : super(key: key);
  final screenCubit = sl<PostCubit>();
  final Post post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorManager.black,
        child: Container(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
          color: ColorManager.darkGrey,
          child: ListView(
            children: [
              ListTile(
                onTap: () => sort(context, post),
                leading: Icon(
                  Icons.rocket,
                  size: 30.w,
                  color: ColorManager.greyColor,
                ),
                title: 'Best'
                    .text
                    .bold
                    .color(ColorManager.greyColor)
                    .xl
                    .make()
                    .p8(),
              ),
              ListTile(
                onTap: () => sort(context, post),
                leading: Icon(Icons.new_releases, size: 30.w),
                title: 'New'.text.bold.xl.make().p8(),
              ),
              ListTile(
                onTap: () => sort(context, post),
                leading: Icon(
                  Icons.upload_outlined,
                  size: 30.w,
                  color: ColorManager.greyColor,
                ),
                title: 'Top'
                    .text
                    .bold
                    .color(ColorManager.greyColor)
                    .xl
                    .make()
                    .p8(),
              ),
              ListTile(
                onTap: () => sort(context, post),
                leading: Icon(
                  Icons.mic,
                  size: 30.w,
                  color: ColorManager.greyColor,
                ),
                title: 'Q&A'
                    .text
                    .bold
                    .color(ColorManager.greyColor)
                    .xl
                    .make()
                    .p8(),
              ),
              ListTile(
                onTap: () => sort(context, post),
                leading: Icon(
                  Icons.access_time_sharp,
                  size: 30.w,
                  color: ColorManager.greyColor,
                ),
                title: 'Controversial'
                    .text
                    .bold
                    .color(ColorManager.greyColor)
                    .xl
                    .make()
                    .p8(),
              ),
              RoundedCornerButton(
                color: ColorManager.grey,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: 'Close'.text.color(Colors.white).bold.xl.make().p8(),
              ).p12().cornerRadius(20)
            ],
          ),
        ),
      ).h(context.screenHeight * .42),
    );
  }

  void sort(BuildContext context, Post post) {
    screenCubit.update(screenCubit.state.data!
        .copyWith(comments: post.comments.reversed.toList()));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
