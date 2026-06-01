import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:product_catelog_app/main.export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

mixin ApiHandler {
  Dio get client => locate<DioClient>().dio;

  FutureReport<T> handle<T>({
    required Future<Response> Function() call,
    required FutureOr<T> Function(dynamic map) mapper,
  }) async {
    try {
      final Response(:statusCode, :data) = await call();

      return right(await mapper(data));
    } on SocketException catch (e, st) {
      return failure(e.message, e: e, s: st);
    } on DioException catch (e) {
      return left(e.toFailure());
    } on Failure catch (e) {
      return left(e);
    } catch (e, s) {
      return failure('Unexpected error.', e: e, s: s);
    }
  }
}

extension DioErrorX on DioException {
  Failure toFailure() {
    // No internet or connection issues
    try {
      if (type == .connectionError || type == .connectionTimeout || type == .unknown) {
        return const Failure('No internet connection.');
      }

      // Timeout
      if (type == .receiveTimeout || type == .sendTimeout) {
        return const Failure('Connection timed out.');
      }

      final status = response?.statusCode ?? 0;

      var res = response?.data;

      if (res case final String s when !s.low.startsWith('<!DOCTYPE html>'.low)) res = jsonDecode(s);

      final serverMessage = switch (res) {
        {'message': final String msg} when msg != 'Validation Error' => msg,
        {'errorDetails': final Map m} when m.isNotEmpty => null,
        _ => null,
      };

      if (serverMessage != null && serverMessage.isNotEmpty) {
        return Failure(serverMessage, error: this, stackTrace: stackTrace);
      }

      return Failure('Something went wrong. (code $status)', error: this, stackTrace: stackTrace);
    } catch (e, s) {
      return Failure('Something went wrong.', error: e, stackTrace: s);
    }
  }
}
