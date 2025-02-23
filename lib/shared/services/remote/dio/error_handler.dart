import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class ErrorHandler implements Exception {
  String _errorMessage = "";
  int _errorStatusCode = 0;

  ErrorHandler(this._errorMessage, this._errorStatusCode);

  ErrorHandler.dioException({required DioException error}) {
    _handleDioException(error);
  }

  ErrorHandler.otherException(String? msg) {
    _handleOtherException(msg);
  }

  //error getter
  getErrorMessage() {
    return _errorMessage;
  }

  int statusCode() {
    return _errorStatusCode;
  }

  //error will be type ,cast etc..
  _handleOtherException(String? msg) {
    _errorMessage = msg ?? "Something went Wrong";
    ErrorHandler serverError = ErrorHandler(_errorMessage, 00);
    return serverError;
  }

  //error will be network related
  _handleDioException(DioException error) {
    ErrorHandler serverError;
    
    _errorStatusCode = error.response?.statusCode ?? 0;
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request Canceled";

        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection time out";
        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Received timeout";
        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 503) {
          _errorMessage = "Something went wrong";
          serverError =
              ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        } else if (error.response?.statusCode == 401) {
          _errorMessage = handleBadRequest(error.response?.data);
          serverError =
              ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        } else if (error.response?.statusCode == 400) {
          _errorMessage = handleBadRequest(error.response?.data);
          serverError =
              ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        } else if (error.response?.statusCode == 500) {
          _errorMessage = handleBadRequest(error.response?.data);
          serverError =
              ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        } else {
          _errorMessage = handleBadRequest(error.response?.data);
          serverError =
              ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        }
        break;
      case DioExceptionType.unknown:
        // Logger.log(msg: "Called here unknown");
        _errorMessage = "Something went wrong";
        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
      case DioExceptionType.sendTimeout:
        if (kReleaseMode) {
          _errorMessage = "Something went wrong";
        } else {
          _errorMessage = "Received timeout";
        }
        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
      case DioExceptionType.connectionError:
        _errorMessage = "No Internet connection";
        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
      default:
        _errorMessage = error.response?.statusMessage ?? "Something went wrong";
        serverError =
            ErrorHandler(_errorMessage, error.response?.statusCode ?? 00);
        break;
    }
    return serverError;
  }

  // this is a sample error structure it might change on your case
  // so you have to add your own error structure  in order to catch the errors
  String handleBadRequest(Map<String, dynamic>? errorData) {
    String error = "";
    if (errorData?['message'] != null) {
      final message = errorData?['message'];
      error = message;
    } else if (errorData?['error_description'] != null) {
      final message = errorData?['error_description'];
      error = message;
    } else if (errorData?['error'] != null) {
      try {
        final errorObject = errorData?['error'];
        final message = errorObject['message'];
        final dynamic errorTag =
            message.keys.first; // Extract the first key dynamically
        error = message[errorTag];
      } catch (e) {
        error = errorData?['message'] ?? "";
      }
    } else if (errorData?['errors'] == null && errorData?.entries != null) {
      for (var item in errorData!.entries) {
        error = item.value.toString();
        break;
      }
    } else {
      error = "Something went wrong";
    }

    return error;
  }
}
