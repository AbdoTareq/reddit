import 'package:reddit/core/color_manager.dart';
import 'package:reddit/core/view/widgets/custom_app_bar.dart';
import 'package:reddit/export.dart';
import 'package:reddit/features/post/post_cubit.dart';
import 'package:reddit/features/post/post_state.dart';
import 'package:reddit/features/post/video_actions.dart';
import 'package:reddit/features/post/my_video_player.dart';
import 'package:video_player/video_player.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final screenCubit = PostCubit();

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostCubit, PostState>(
        bloc: screenCubit,
        listener: (BuildContext context, PostState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, PostState state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return buildBody(state);
        },
      ),
    );
  }

  Widget buildBody(PostState state) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          flexibleSpace: CustomAppBar(title: '•r/MechanicalKeyboards'),
          actions: ['•••'.text.bold.xl.make().px24()],
        ),
        SliverAppBar(
          expandedHeight: 1.sh - .19.sh,
          collapsedHeight: .23.sh,
          pinned: true,
          flexibleSpace: Scaffold(
            backgroundColor: ColorManager.black,
            body: Stack(
              children: [
                MyVideoPlayer(),
                Positioned(
                  bottom: 100.h,
                  left: 8.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomListTile(
                        leading: Image.asset('assets/images/logo.png').w(35.w),
                        title: 'Xury46'.text.xl.make(),
                      ).py12(),
                      'After a year of collecting parts for this build, I present my finished Heavy-9 (Thocky typing test at the end!)'
                          .text
                          .xl
                          .make()
                    ],
                  ).w(.85.sw),
                ),
                VideoActions(),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
            childCount: 50,
          ),
        ),
      ],
    );
  }
}
