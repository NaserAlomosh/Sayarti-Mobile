const _redactedValue = '***';

final _sensitiveValuePattern = RegExp(
  r'''(?i)((?:["']?)(?:password|otp|accessToken|refreshToken|idToken|googleIdToken|fcmToken|cookie|set-cookie)(?:["']?)\s*[:=]\s*)(?:"[^"]*"|'[^']*'|[^,\r\n}\]]+)''',
);

final _authorizationPattern = RegExp(
  r'''(?i)((?:["']?)authorization(?:["']?)\s*[:=]\s*)(?:Bearer\s+)?(?:"[^"]*"|'[^']*'|[^,\r\n}\]]+)''',
);

/// Redacts credential values from a logger's rendered output only.
///
/// The original Dio request and response objects are never changed.
String redactNetworkLog(Object? log) {
  return log
      .toString()
      .replaceAllMapped(
        _sensitiveValuePattern,
        (match) => '${match.group(1)}$_redactedValue',
      )
      .replaceAllMapped(
        _authorizationPattern,
        (match) => '${match.group(1)}Bearer $_redactedValue',
      );
}
