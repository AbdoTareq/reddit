// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/core/constants.dart';
import 'package:reddit/features/post/presentation/post_state.dart';
import 'package:reddit/features/post/repos/post_repo.dart';
import 'package:reddit/models/post.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(
    this.repo,
  ) : super(PostState(isLoading: true));

  final PostRepository repo;

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(Duration(milliseconds: 500));
      emit(state.copyWith(isLoading: false, data: (await repo.getAll())));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }

  Future<void> update(Post post) async =>
      emit(state.copyWith(isLoading: false, data: (await repo.update(post))));
}
