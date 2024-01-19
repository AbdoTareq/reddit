class CommentModel {
  final String user;
  final String content;
  final List<CommentModel> children;
  final int votes;
  CommentModel({
    this.user = '',
    this.content = '',
    this.children = const [],
    this.votes = 0,
  });

  CommentModel copyWith({
    String? user,
    String? content,
    List<CommentModel>? children,
    int? votes,
  }) {
    return CommentModel(
      user: user ?? this.user,
      content: content ?? this.content,
      children: children ?? this.children,
      votes: votes ?? this.votes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'content': content,
      'children': children.map((x) => x.toMap()).toList(),
      'votes': votes,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      user: (map['user'] ?? '') as String,
      content: (map['content'] ?? '') as String,
      children: List<CommentModel>.from(
        (map['children'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      votes: (map['votes'] ?? 0) as int,
    );
  }

  @override
  String toString() {
    return 'Comment(user: $user, content: $content, children: $children, votes: $votes)';
  }
}
