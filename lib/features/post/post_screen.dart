import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/core/view/widgets/custom_app_bar.dart';
import 'package:reddit/export.dart';
import 'package:reddit/features/post/post_cubit.dart';
import 'package:reddit/features/post/post_state.dart';
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
          expandedHeight: 1.sh,
          toolbarHeight: .22.sh,
          floating: true,
          pinned: true,
          title: Chewie(
            controller: ChewieController(
                videoPlayerController: VideoPlayerController.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')),
          ).wFull(context).centered(),
        ),
        // Add other slivers or widgets here
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
