import 'package:reddit/core/color_manager.dart';

import '../../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.searchController,
  }) : super(key: key);

  final SearchController? searchController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: title.text.xl.white.bold.make(),
          leading: Icon(Icons.arrow_back, color: Colors.white),
          backgroundColor: ColorManager.black,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(.06.sh);
}
