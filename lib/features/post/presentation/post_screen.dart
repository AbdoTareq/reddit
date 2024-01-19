import 'package:reddit/core/view/widgets/custom_app_bar.dart';
import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/comment.dart';
import 'package:reddit/features/post/presentation/my_video_player.dart';
import 'package:reddit/features/post/presentation/post_cubit.dart';
import 'package:reddit/features/post/presentation/post_state.dart';
import 'package:reddit/features/post/presentation/video_actions.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final screenCubit = PostCubit();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  bool showVideoActions = true;
  bool showReply = false;

  @override
  void initState() {
    screenCubit.loadInitialData();
    scrollController.addListener(() {
      showVideoActions = scrollController.offset < 100;
      setState(() {});
    });
    textEditingController.addListener(() {
      showReply = textEditingController.text.isNotEmpty;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostCubit, PostState>(
        bloc: screenCubit,
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
    return Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
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
                    if (showVideoActions) ...[
                      Positioned(
                        bottom: 100.h,
                        left: 8.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomListTile(
                              leading:
                                  Image.asset('assets/images/logo.png').w(35.w),
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
                    ]
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10 + 1,
                (BuildContext context, int index) {
                  return index == 10 ? 100.heightBox : Comment();
                },
              ),
            ),
          ],
        ),
        if (!showVideoActions) ...[
          Positioned(
              bottom: 0,
              child: Container(
                  color: ColorManager.greyBlack,
                  height: 120,
                  child: TextInput(
                          borderColor: ColorManager.grey,
                          hintColor: ColorManager.white,
                          color: ColorManager.grey,
                          suffixIcon: showReply
                              ? VxCapsule(
                                  width: 30,
                                  height: 40,
                                  backgroundColor: Colors.purple.shade200,
                                  child: 'Reply'.text.bold.makeCentered(),
                                ).px8()
                              : Icon(Icons.image),
                          controller: textEditingController,
                          hint: 'Add a comment')
                      .px(12)
                      .pOnly(top: 8)
                      .wFull(context))),
          Positioned(
            right: 24.w,
            bottom: .3.sh,
            child: Icon(Icons.keyboard_arrow_down_outlined)
                .circle(radius: 40, backgroundColor: ColorManager.grey)
                .onTap(() {
              scrollController.animToBottom();
            }),
          ),
        ]
      ],
    );
  }
}
