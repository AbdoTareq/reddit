import 'package:reddit/core/view/widgets/custom_app_bar.dart';
import 'package:reddit/core/view/widgets/shimmer_list.dart';
import 'package:reddit/export.dart';
import 'package:reddit/features/post/presentation/comment.dart';
import 'package:reddit/features/post/presentation/comment_sort_sheet.dart';
import 'package:reddit/features/post/presentation/my_video_player.dart';
import 'package:reddit/features/post/presentation/post_cubit.dart';
import 'package:reddit/features/post/presentation/post_state.dart';
import 'package:reddit/features/post/presentation/video_actions.dart';
import 'package:reddit/models/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final screenCubit = sl<PostCubit>();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  bool showVideoActions = true;
  bool showReply = false;
  @override
  void dispose() {
    scrollController.removeListener(() {});
    textEditingController.removeListener(() {});
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

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
            return ListView(
              children: [
                VxShimmer(child: ShimmerChild(height: 400)),
                ...List.generate(
                    6, (index) => VxShimmer(child: ShimmerChild(height: 100)))
              ],
            );
          }
          if (state.error != null) {
            return state.error!.text.red500.bold.xl.makeCentered().p8();
          }
          return buildBody(state.data!);
        },
      ),
    );
  }

  Widget buildBody(Post post) {
    return Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: false,
              flexibleSpace: CustomAppBar(title: post.title),
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
                    MyVideoPlayer(videoId: post.videoId),
                    if (showVideoActions) ...[
                      Positioned(
                        bottom: 100.h,
                        left: 8.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomListTile(
                              leading: Image.asset(post.userImage).w(35.w),
                              title: post.user.text.xl.make(),
                            ).py12(),
                            post.content.text.xl.make()
                          ],
                        ).w(.85.sw),
                      ),
                      VideoActions(post, scrollController),
                    ]
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.upload),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        'Top comments'.text.bold.xl.make(),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    onTap: () => showBottomSheet(
                        context: context,
                        builder: (x) => CommentSortSheet(post)),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: post.comments.length + 1,
                (BuildContext context, int index) {
                  return index == post.comments.length
                      ? 120.h.heightBox
                      : Comment(post.comments[index]);
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
                          textColor: ColorManager.white,
                          color: ColorManager.grey,
                          suffixIcon: showReply
                              ? VxCapsule(
                                  width: 30,
                                  height: 40,
                                  backgroundColor: Colors.purple.shade200,
                                  child: 'Reply'.text.bold.makeCentered(),
                                ).px8().onTap(() async {
                                  await reply(post);
                                })
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

  Future<void> reply(Post post) async {
    screenCubit.update(post.copyWith(
        comments: post.comments.addT(post.comments.first
            .copyWith(content: textEditingController.text))));
    FocusManager.instance.primaryFocus!.unfocus();
    textEditingController.text = '';
    await Future.delayed(Duration(milliseconds: 800));
    scrollController.animToBottom();
  }
}
