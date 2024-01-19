import '../../export.dart';

class ChBottomSheet extends StatelessWidget {
  const ChBottomSheet({
    Key? key,
  }) : super(key: key);

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
}
