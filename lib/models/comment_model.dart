// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommentModel {
  final String id;
  final String user;
  final String userImage;
  final String content;
  final List<CommentModel> children;
  final int votes;
  final bool isUserOnline;

  CommentModel({
    this.id = '',
    this.user = '',
    this.userImage = '',
    this.content = '',
    this.children = const [],
    this.votes = 0,
    this.isUserOnline = false,
  });

  CommentModel copyWith({
    String? id,
    String? user,
    String? userImage,
    String? content,
    List<CommentModel>? children,
    int? votes,
    bool? isUserOnline,
  }) {
    return CommentModel(
      id: id ?? this.id,
      user: user ?? this.user,
      userImage: userImage ?? this.userImage,
      content: content ?? this.content,
      children: children ?? this.children,
      votes: votes ?? this.votes,
      isUserOnline: isUserOnline ?? this.isUserOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'userImage': userImage,
      'content': content,
      'children': children.map((x) => x.toMap()).toList(),
      'votes': votes,
      'isUserOnline': isUserOnline,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: (map['id'] ?? '') as String,
      user: (map['user'] ?? '') as String,
      userImage: (map['userImage'] ?? '') as String,
      content: (map['content'] ?? '') as String,
      children: List<CommentModel>.from(
        (map['children'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      votes: (map['votes'] ?? 0) as int,
      isUserOnline: (map['isUserOnline'] ?? false) as bool,
    );
  }

  @override
  String toString() {
    return 'CommentModel(id: $id, user: $user, userImage: $userImage, content: $content, children: $children, votes: $votes, isUserOnline: $isUserOnline)';
  }
}
