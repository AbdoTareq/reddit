// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reddit/models/post.dart';

class PostState {
  final bool isLoading;
  final String? error;
  final Post? data;

  const PostState({
    this.isLoading = false,
    this.error,
    this.data,
  });

  PostState copyWith({
    bool? isLoading,
    String? error,
    Post? data,
  }) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoading': isLoading,
      'error': error,
      'data': data?.toMap(),
    };
  }

  factory PostState.fromMap(Map<String, dynamic> map) {
    return PostState(
      isLoading: (map['isLoading'] ?? false) as bool,
      error: map['error'] != null ? map['error'] as String : null,
      data: map['data'] != null
          ? Post.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() =>
      'PostState(isLoading: $isLoading, error: $error, data: $data)';
}
