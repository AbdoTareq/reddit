class PostState {
	final bool isLoading;
	final String? error;
	  
	const PostState({
		this.isLoading = false,
		this.error,
	});
	  
	PostState copyWith({
		bool? isLoading,
		String? error,
	}) {
		return PostState(
			isLoading: isLoading ?? this.isLoading,
			error: error ?? this.error,
		);
	}
}
