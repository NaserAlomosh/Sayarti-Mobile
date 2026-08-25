class AppEndpoints {
  AppEndpoints._();

  // ---------------------------------------------------------------------------
  // Endpoint names
  // ---------------------------------------------------------------------------

  static const String getCurrentAppVersion =
      'GetCurrentAppVersion';

  static const String getMobileConfigDetails =
      'GetMobileConfigDetails';

  static const String login = 'login';

  // ---------------------------------------------------------------------------
  // Public endpoints
  // ---------------------------------------------------------------------------

  /// Endpoints that do not use the user's session token.
  static const Set<String> publicEndpoints = {
    getCurrentAppVersion,
    login,
  };

  // ---------------------------------------------------------------------------
  // Mobile configuration endpoints
  // ---------------------------------------------------------------------------

  /// Endpoints that use the dedicated mobile-config authorization token.
  static const Set<String> mobileConfigEndpoints = {
    getMobileConfigDetails,
  };

  // ---------------------------------------------------------------------------
  // Public-key endpoints
  // ---------------------------------------------------------------------------

  /// Endpoints whose response contains the request-encryption public key.
  static const Set<String> publicKeyEndpoints = {
    getCurrentAppVersion,
  };

  // ---------------------------------------------------------------------------
  // Encryption exclusions
  // ---------------------------------------------------------------------------

  /// Only these endpoints are excluded from request encryption.
  ///
  /// The current-app-version endpoint must remain excluded because its
  /// response provides the public key required for later encrypted requests.
  ///
  /// All other endpoints, including GetMobileConfigDetails, must pass through
  /// EncryptionInterceptor.
  static const Set<String> encryptionExcludedEndpoints = {
    getCurrentAppVersion,
  };

  // ---------------------------------------------------------------------------
  // Public helpers
  // ---------------------------------------------------------------------------

  static bool isPublicEndpoint(String path) {
    return _matches(
      path: path,
      endpoints: publicEndpoints,
    );
  }

  static bool isMobileConfigEndpoint(String path) {
    return _matches(
      path: path,
      endpoints: mobileConfigEndpoints,
    );
  }

  static bool isPublicKeyEndpoint(String path) {
    return _matches(
      path: path,
      endpoints: publicKeyEndpoints,
    );
  }

  static bool isEncryptionExcluded(String path) {
    return _matches(
      path: path,
      endpoints: encryptionExcludedEndpoints,
    );
  }

  static bool shouldEncrypt(String path) {
    return !isEncryptionExcluded(path);
  }

  static bool shouldResetDeviceInfo(String path) {
    return isPublicKeyEndpoint(path);
  }

  // ---------------------------------------------------------------------------
  // Matching
  // ---------------------------------------------------------------------------

  static bool _matches({
    required String path,
    required Set<String> endpoints,
  }) {
    final endpointName = _extractEndpointName(path);

    return endpoints.any(
      (endpoint) =>
          endpointName == _normalize(endpoint),
    );
  }

  static String _extractEndpointName(String value) {
    final parsedPath = _extractPath(value);

    final segments = parsedPath
        .split('/')
        .where((segment) => segment.trim().isNotEmpty)
        .toList(growable: false);

    if (segments.isEmpty) {
      return '';
    }

    return _normalize(segments.last);
  }

  static String _extractPath(String value) {
    final normalizedValue = value.trim();

    if (normalizedValue.isEmpty) {
      return '';
    }

    final uri = Uri.tryParse(normalizedValue);

    if (uri != null && uri.path.isNotEmpty) {
      return uri.path;
    }

    return normalizedValue
        .split('?')
        .first
        .split('#')
        .first;
  }

  static String _normalize(String value) {
    return value.trim().toLowerCase();
  }
}