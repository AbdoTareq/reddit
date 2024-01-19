import 'package:reddit/export.dart';

class VideoActions extends StatelessWidget {
  const VideoActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100.h,
      right: 12.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.upload_outlined, size: 30.w),
          ),
          '266'.text.bold.xl.make(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download_outlined, size: 30.w),
          ).pOnly(bottom: 12.h),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mode_comment_outlined, size: 30.w),
          ),
          '61'.text.bold.xl.make().pOnly(bottom: 12.h),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.ios_share_rounded, size: 30.w),
          ),
        ],
      ),
    );
  }
}
