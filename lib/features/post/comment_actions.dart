import 'package:reddit/features/post/ch_bottom_sheet.dart';

import '../../export.dart';

class CommentActions extends StatelessWidget {
  const CommentActions({
    super.key,
  });

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
          showBottomSheet(context: context, builder: (x) => ChBottomSheet());
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
          onPressed: () {},
          icon: Icon(Icons.upload_outlined, size: 28.w),
        ),
        6.w.widthBox,
        '1'.text.bold.color(ColorManager.white38).make(),
        IconButton(
          color: ColorManager.white38,
          onPressed: () {},
          icon: Icon(Icons.download_outlined, size: 28.w),
        ),
      ],
    );
  }
}
