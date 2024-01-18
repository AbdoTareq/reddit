import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_template/features/post/post_state.dart';

class PostCubit extends Cubit<PostState> {
	PostCubit() : super(PostState(isLoading: true));
	
	Future<void> loadInitialData() async {
		final stableState = state;
		try {
		  emit(state.copyWith(isLoading: true));
	
		  // TODO your code here
	
		  emit(state.copyWith(isLoading: false));
		} catch (error) {
		  emit(state.copyWith(error: error.toString()));
		  emit(stableState.copyWith(isLoading: false));
		}
	}
}
