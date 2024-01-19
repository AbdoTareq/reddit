import 'package:reddit/features/post/datasource/post_remote_datasource.dart';
import 'package:reddit/models/post.dart';

class PostRepository {
  final PostRemoteDatasource api;

  PostRepository(this.api);

  Post getAll() {
    return api.getAll();
  }

  Post update(Post obj) {
    return api.update(obj);
  }
}
