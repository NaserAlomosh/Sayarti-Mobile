class BaseResponseEntity<T> {
  const BaseResponseEntity({
    required this.success,
    this.data,
    this.message,
  });

  final bool success;
  final T? data;
  final String? message;
}