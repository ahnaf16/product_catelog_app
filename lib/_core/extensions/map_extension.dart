extension RemoveNull<K, V> on Map<K, V?> {
  Map<K, V> removeNull() {
    final result = {...this}..removeWhere((_, v) => v == null);
    return result.map((key, value) => MapEntry(key, value as V));
  }

  Map<K, V> removeNullAndEmpty() {
    final it = removeNull();
    final result = it
      ..removeWhere(
        (k, v) => switch (v) {
          _ when v is String && v.isEmpty => true,
          _ when v is List && v.isEmpty => true,
          _ when v is Map && v.isEmpty => true,
          _ => false,
        },
      );
    return result.map((key, value) => MapEntry(key, value));
  }
}
