import 'dart:math';

import 'package:reddit/models/comment_model.dart';
import 'package:reddit/models/post.dart';

class PostRemoteDatasource {
  List<Post> posts = [
    Post(
      id: '1',
      title: '•r/MechanicalKeyboards',
      userImage: 'assets/images/logo.png',
      user: 'Xury46',
      content:
          'After a year of collecting parts for this build, I present my finished Heavy-9 (Thocky typing test at the end!)',
      videoId:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      votes: 266,
      comments: [
        CommentModel(
          id: Random().nextDouble().toString(),
          isUserOnline: true,
          userImage: 'assets/images/logo.png',
          user: 'Practical-Stay-9674 • Now',
          votes: 1,
          content: 'Heelooo',
        ),
        CommentModel(
          id: Random().nextDouble().toString(),
          isUserOnline: false,
          userImage: 'assets/images/logo.png',
          user: 'elvindrew • 3h',
          votes: 2,
          content: 'Amazing',
        ),
        CommentModel(
          id: Random().nextDouble().toString(),
          isUserOnline: true,
          userImage: 'assets/images/logo.png',
          user: 'abdo • 3h',
          votes: 2,
          content: 'Great build!',
        ),
        CommentModel(
          id: Random().nextDouble().toString(),
          isUserOnline: false,
          userImage: 'assets/images/logo.png',
          user: 'Ahmed • 2h',
          votes: 2,
          content: 'Amazing',
        ),
        CommentModel(
          id: Random().nextDouble().toString(),
          isUserOnline: true,
          userImage: 'assets/images/logo.png',
          user: 'Medo • 4h',
          votes: 2,
          content: 'Test',
        ),
        CommentModel(
          id: Random().nextDouble().toString(),
          isUserOnline: false,
          userImage: 'assets/images/logo.png',
          user: 'Sami • 4h',
          votes: 2,
          content: 'Definitely very gorgeous, veracity steel is probably',
        ),
        CommentModel(
            id: Random().nextDouble().toString(),
            isUserOnline: true,
            userImage: 'assets/images/logo.png',
            user: 'Betterasathief • 5h',
            votes: 2,
            content: 'Great build!',
            children: [
              CommentModel(
                id: Random().nextDouble().toString(),
                isUserOnline: true,
                userImage: 'assets/images/logo.png',
                user: 'Practical-Stay-9674 • Now',
                votes: 1,
                children: [
                  CommentModel(
                    id: Random().nextDouble().toString(),
                    isUserOnline: true,
                    userImage: 'assets/images/logo.png',
                    user: 'elvindrew • 3h',
                    votes: 2,
                    content: 'Great build!',
                  ),
                ],
                content: 'Heelooo',
              ),
            ]),
      ],
    ),
  ];
  Post getAll() => posts.first;

  update(Post post) {
    final index = posts.indexWhere((element) => element.id == post.id);
    posts[index] = post;
    return posts.first;
  }
}
