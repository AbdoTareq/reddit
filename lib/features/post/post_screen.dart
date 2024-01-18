import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_template/features/post/post_cubit.dart';
import 'package:flutter_new_template/features/post/post_state.dart';

class PostScreen extends StatefulWidget {
	const PostScreen({Key? key}) : super(key: key);
	
	@override
	_PostScreenState createState() => _PostScreenState();
}
	
class _PostScreenState extends State<PostScreen> {
	final screenCubit = PostCubit();
	
	@override
	void initState() {
		screenCubit.loadInitialData();
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: BlocConsumer<PostCubit, PostState>(
				bloc: screenCubit,
				listener: (BuildContext context, PostState state) {
					if (state.error != null) {
						// TODO your code here
					}
				},
				builder: (BuildContext context, PostState state) {
					if (state.isLoading) {
						return Center(child: CircularProgressIndicator());
					}
	
					return buildBody(state);
				},
			),
		);
	}
	
	Widget buildBody(PostState state) {
		return ListView(
			children: [
				// TODO your code here
			],
		);
	}
}
