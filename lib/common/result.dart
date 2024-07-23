abstract class Result<T> {
  // Factory constructor for initial
  factory Result.initial() = Initial<T>;
  // Factory constructor for success
  factory Result.success(T data) = Success<T>;
  // Factory constructor for error
  factory Result.failed(String message) = Failed<T>;
  // Factory constructor for loading
  factory Result.loading() = Loading<T>;

  // Private constructor to prevent direct instantiation
  Result._();
}

// Initial subclass
class Initial<T> extends Result<T> {
  Initial() : super._();
}

// Success subclass
class Success<T> extends Result<T> {
  final T data;

  Success(this.data) : super._();
}

// Error subclass
class Failed<T> extends Result<T> {
  final String message;

  Failed(this.message) : super._();
}

// Loading subclass
class Loading<T> extends Result<T> {
  Loading() : super._();
}
