import 'package:dio/dio.dart';

// Sealed class — every possible network failure is one of these types.
// Callers use pattern matching (switch) to handle each case.
sealed class NetworkException implements Exception {
  const NetworkException(this.message);
  final String message;

  @override
  String toString() => message;
}

final class CityNotFoundException extends NetworkException {
  const CityNotFoundException()
      : super('City not found. Please check the name and try again.');
}

final class NoInternetException extends NetworkException {
  const NoInternetException()
      : super('No internet connection. Please check your network.');
}

final class RequestTimeoutException extends NetworkException {
  const RequestTimeoutException()
      : super('Request timed out. Please try again.');
}

final class InvalidApiKeyException extends NetworkException {
  const InvalidApiKeyException()
      : super('Invalid API key. Please check your OpenWeatherMap key.');
}

final class ServerException extends NetworkException {
  const ServerException([super.message = 'Server error. Please try again later.']);
}

final class UnknownException extends NetworkException {
  const UnknownException([super.message = 'An unexpected error occurred.']);
}

// Converts a raw DioException into a typed NetworkException.
NetworkException mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return const RequestTimeoutException();

    case DioExceptionType.connectionError:
      return const NoInternetException();

    case DioExceptionType.badResponse:
      final status = e.response?.statusCode;
      if (status == 404) return const CityNotFoundException();
      if (status == 401) return const InvalidApiKeyException();
      return ServerException('Server returned $status.');

    default:
      return UnknownException(e.message ?? 'Unknown error.');
  }
}
