abstract class Failure {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// exception in fromMap or fromJson
class SerializeFailure extends Failure {
  @override
  List<Object?> get props => [];
}
