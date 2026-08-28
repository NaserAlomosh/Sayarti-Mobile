const _redactedValue = '***';

final _sensitiveValuePattern = RegExp(
  r'''((?:["']?)(?:password|otp|accessToken|refreshToken|idToken|googleIdToken|fcmToken|cookie|set-cookie)(?:["']?)\s*[:=]\s*)(?:"[^"]*"|'[^']*'|[^,\r\n}\]]+)''',
  caseSensitive: false,
);

final _authorizationPattern = RegExp(
  r'''((?:["']?)authorization(?:["']?)\s*[:=]\s*)(?:Bearer\s+)?(?:"[^"]*"|'[^']*'|[^,\r\n}\]]+)''',
  caseSensitive: false,
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