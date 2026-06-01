import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension ValueEx on ValueNotifier<bool> {
  void toggle() => value = !value;
  void truthy() => value = true;
  void falsey() => value = false;

  Future<T> waitUntil<T>(Future<T> Function() fn) async {
    try {
      truthy();
      final res = await fn();
      falsey();
      return res;
    } catch (e) {
      falsey();
      rethrow;
    } finally {
      falsey();
    }
  }
}

extension NumEx on num {
  String currency({bool compact = false, int decimalDigits = 2}) {
    if (compact) {
      return NumberFormat.compactSimpleCurrency(decimalDigits: isInt ? 0 : decimalDigits).format(normalize());
    }
    return NumberFormat.simpleCurrency(decimalDigits: isInt ? 0 : decimalDigits).format(normalize());
  }

  String compact() {
    return NumberFormat.compact().format(this);
  }

  num normalize() {
    if (this is double) {
      final d = this as double;
      if (d == d.truncateToDouble()) {
        return d.toInt();
      }
    }

    return this;
  }

  bool get isInt {
    if (this is int) return true;
    return this == truncateToDouble();
  }
}
