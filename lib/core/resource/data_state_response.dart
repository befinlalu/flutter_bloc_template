import 'package:dio/dio.dart';

// Abstract base class for response handling
abstract class DataStateResponse<T> {
  final T? data; // Holds the response data
  final DioException? dioException; // Holds a DioException in case of error

  const DataStateResponse({
    this.data,
    this.dioException,
  });
}

// Represents a successful API response
class DataStateSuccess<T> extends DataStateResponse<T> {
  // Constructor for successful response
  const DataStateSuccess(T data) : super(data: data);
}

// Represents a failed API response
class DataStateFailed<T> extends DataStateResponse<T> {
  // Constructor for failed response
  const DataStateFailed(DioException dioException)
      : super(dioException: dioException);
}
