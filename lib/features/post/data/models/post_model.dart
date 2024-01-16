// use the methods without encoding & decoding as dio auto decode response
import 'package:flutter_new_template/features/post/domain/entities/post.dart';

List<PostModel> postsFromJson(List<dynamic> list) =>
    List<PostModel>.from(list.map((x) => PostModel.fromJson(x)));

postsToJson(List<PostModel> data) =>
    List<dynamic>.from(data.map((x) => x.toJson()));

class PostModel extends Post {
  const PostModel({int? id, required String title, required String body})
      : super(id: id, title: title, body: body);

  PostModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      id: (map['id'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      body: (map['body'] ?? '') as String,
    );
  }

  @override
  String toString() {
    return 'Post(id: $id, title: $title, body: $body)';
  }
}
