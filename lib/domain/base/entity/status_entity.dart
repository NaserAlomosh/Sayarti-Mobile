class StatusEntity {
  const StatusEntity({
    this.isSuccess,
    this.code,
    this.severity,
    this.statusMessage,
  });

  final bool? isSuccess;
  final String? code;
  final String? severity;
  final String? statusMessage;
}