import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/post_cubit.dart';
import 'package:reddit/models/comment_model.dart';

class ChBottomSheet extends StatelessWidget {
  ChBottomSheet(
    this.comment, {
    Key? key,
  }) : super(key: key);
  final screenCubit = sl<PostCubit>();
  final CommentModel comment;
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
                leading: Icon(Icons.ios_share, size: 30.w),
                title: 'Share'.text.bold.xl.make().p8(),
              ),
              ListTile(
                leading: Icon(Icons.save, size: 30.w),
                title: 'Save'.text.bold.xl.make().p8(),
              ),
              ListTile(
                leading: Icon(Icons.notifications, size: 30.w),
                title: 'Stop reply notifications'.text.bold.xl.make().p8(),
              ),
              ListTile(
                leading: Icon(Icons.copy, size: 30.w),
                title: 'Copy text'.text.bold.xl.make().p8(),
              ),
              ListTile(
                leading: Icon(Icons.close_fullscreen_sharp, size: 30.w),
                title: 'Collapse thread'.text.bold.xl.make().p8(),
              ),
              ListTile(
                leading: Icon(Icons.edit_outlined, size: 30.w),
                title: 'Edit'.text.bold.xl.make().p8(),
              ),
              ListTile(
                onTap: () {
                  showOptionsDialog(context,
                      title: 'Are you sure?',
                      text:
                          'You cannot restore comments that have been deleted.',
                      yesFunction: () {
                    removeComment(context);
                  });
                },
                leading: Icon(Icons.delete_outline, size: 30.w),
                title: 'Delete'.text.bold.xl.make().p8(),
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
      ).h56(context),
    );
  }

  void removeComment(BuildContext context) {
    screenCubit.state.data!.comments.remove(comment);
    screenCubit.update(screenCubit.state.data!);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
