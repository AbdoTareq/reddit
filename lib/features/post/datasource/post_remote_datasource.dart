import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:reddit/models/comment_model.dart';
import 'package:reddit/models/post.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MyApiClient {
  getAll() async => <Post>[
        Post(
          user: 'Xury46',
          content:
              'After a year of collecting parts for this build, I present my finished Heavy-9 (Thocky typing test at the end!)',
          videoId:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          votes: 266,
          comments: [
            CommentModel(
              user: 'Practical-Stay-9674 • Now',
              votes: 1,
              content: 'Heelooo',
            ),
            CommentModel(
              user: 'elvindrew • 3h',
              votes: 2,
              content: 'Great build!',
            ),
            CommentModel(
                user: 'Betterasathief • 5h',
                votes: 2,
                content: 'Great build!',
                children: [
                  CommentModel(
                    user: 'Practical-Stay-9674 • Now',
                    votes: 1,
                    children: [
                      CommentModel(
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
}
