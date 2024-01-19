import '../../export.dart';

showOptionsDialog(BuildContext context,
    {String? title = '',
    String? text = '',
    required Function() yesFunction}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title ?? '👍').text.isIntrinsic.bold.xl2.makeCentered(),
          content: (text ?? 'under_dev').text.isIntrinsic.bold.xl.make(),
          actions: [
            RoundedCornerButton(
              color: ColorManager.red,
              onPressed: yesFunction,
              child: Text(
                'DELETE',
                style: TextStyle(color: Colors.white),
              ),
            ).w32(context),
            RoundedCornerButton(
              color: ColorManager.darkGrey,
              onPressed: () => Navigator.pop(context),
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.white),
              ),
            ).w32(context),
          ],
        );
      });
}
