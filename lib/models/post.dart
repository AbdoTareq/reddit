// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reddit/models/comment_model.dart';

class Post {
  final List<CommentModel> comments;
  final String content;
  final String videoId;
  final String user;
  final int votes;
  Post({
    this.comments = const [],
    this.content = '',
    this.videoId = '',
    this.user = '',
    this.votes = 0,
  });

  Post copyWith({
    List<CommentModel>? comments,
    String? content,
    String? videoId,
    String? user,
    int? votes,
  }) {
    return Post(
      comments: comments ?? this.comments,
      content: content ?? this.content,
      videoId: videoId ?? this.videoId,
      user: user ?? this.user,
      votes: votes ?? this.votes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comments': comments.map((x) => x.toMap()).toList(),
      'content': content,
      'videoId': videoId,
      'user': user,
      'votes': votes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      comments: List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      content: (map['content'] ?? '') as String,
      videoId: (map['videoId'] ?? '') as String,
      user: (map['user'] ?? '') as String,
      votes: (map['votes'] ?? 0) as int,
    );
  }

  @override
  String toString() {
    return 'Post(comments: $comments, content: $content, videoId: $videoId, user: $user, votes: $votes)';
  }
}
