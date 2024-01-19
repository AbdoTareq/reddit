import 'package:reddit/models/comment_model.dart';

class Post {
  final String id;
  final String title;
  final List<CommentModel> comments;
  final String content;
  final String videoId;
  final String user;
  final String userImage;
  final int votes;
  Post({
    this.id = '',
    this.title = '',
    this.comments = const [],
    this.content = '',
    this.videoId = '',
    this.user = '',
    this.userImage = '',
    this.votes = 0,
  });

  Post copyWith({
    String? id,
    String? title,
    List<CommentModel>? comments,
    String? content,
    String? videoId,
    String? user,
    String? userImage,
    int? votes,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      comments: comments ?? this.comments,
      content: content ?? this.content,
      videoId: videoId ?? this.videoId,
      user: user ?? this.user,
      userImage: userImage ?? this.userImage,
      votes: votes ?? this.votes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'comments': comments.map((x) => x.toMap()).toList(),
      'content': content,
      'videoId': videoId,
      'user': user,
      'userImage': userImage,
      'votes': votes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      comments: List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      content: (map['content'] ?? '') as String,
      videoId: (map['videoId'] ?? '') as String,
      user: (map['user'] ?? '') as String,
      userImage: (map['userImage'] ?? '') as String,
      votes: (map['votes'] ?? 0) as int,
    );
  }

  @override
  String toString() {
    return 'Post(id: $id, title: $title, comments: $comments, content: $content, videoId: $videoId, user: $user, userImage: $userImage, votes: $votes)';
  }
}
