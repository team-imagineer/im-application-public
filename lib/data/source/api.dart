import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;
import 'package:im_application/data/source/model/result.dart';

import 'model/api_record.dart';

class Api {
  static const timeLimit = Duration(seconds: 10);
  static const minimumInterval = Duration(milliseconds: 500);
  static const baseUrl = "****";
  final http.Client client;
  ApiRecord? lastApiRecord;

  Api(this.client);

  Future<Result<dynamic>> post(String path,
      {Map<String, String>? headers, Object? body}) async {
    return request(
      HttpMethod.post,
      path,
      headers: headers,
      body: body,
    );
  }

  Future<Result<dynamic>> get(String path,
      {Map<String, String>? headers}) async {
    return request(
      HttpMethod.get,
      path,
      headers: headers,
    );
  }

  Future<Result<dynamic>> put(String path,
      {Map<String, String>? headers, Object? body}) async {
    return request(
      HttpMethod.put,
      path,
      headers: headers,
      body: body,
    );
  }

  Future<Result<dynamic>> delete(String path,
      {Map<String, String>? headers}) async {
    return request(
      HttpMethod.delete,
      path,
      headers: headers,
    );
  }

  Future<Result<dynamic>> request(
    HttpMethod method,
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    print("$method $path");

    final apiRecord = ApiRecord(
      timestamp: DateTime.now(),
      method: method,
      path: path,
    );

    if (lastApiRecord != null &&
        lastApiRecord!.path == apiRecord.path &&
        lastApiRecord!.method == apiRecord.method &&
        apiRecord.timestamp.difference(lastApiRecord!.timestamp) <
            minimumInterval) {
      return const Result.error(ApiError.requestError);
    }

    lastApiRecord = apiRecord;

    try {
      final http.Response response;

      if (headers != null) {
        headers["Content-Type"] = "application/json";
      } else {
        headers = {"Content-Type": "application/json"};
      }

      if (body != null) {
        body = jsonEncode(body);
        print(body);
      }

      switch (method) {
        case HttpMethod.get:
          response = await client
              .get(
                Uri.parse(baseUrl + path),
                headers: headers,
              )
              .timeout(timeLimit);
          break;
        case HttpMethod.post:
          response = await client
              .post(
                Uri.parse(baseUrl + path),
                headers: headers,
                body: body,
              )
              .timeout(timeLimit);
          break;
        case HttpMethod.put:
          response = await client
              .put(
                Uri.parse(baseUrl + path),
                headers: headers,
                body: body,
              )
              .timeout(timeLimit);
          break;
        case HttpMethod.delete:
          response = await client
              .delete(
                Uri.parse(baseUrl + path),
                headers: headers,
                body: body,
              )
              .timeout(timeLimit);
          break;
        case HttpMethod.patch:
          response = await client
              .patch(
                Uri.parse(baseUrl + path),
                headers: headers,
                body: body,
              )
              .timeout(timeLimit);
          break;
      }

      print(response.body);

      final jsonResponse =
          response.body.isNotEmpty ? jsonDecode(response.body) : {};

      if (response.statusCode ~/ 100 == 2) {
        return Result.success(jsonResponse);
      } else {
        return Result.error(_getError(response.statusCode));
      }
    } catch (err, stack) {
      print(err);
      print(stack);
      FirebaseCrashlytics.instance
          .recordError(err, stack, reason: 'API CALL ERROR');
      return const Result.error(ApiError.networkError);
    }
  }

  ApiError _getError(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiError.codeError;
      case 401:
      case 403:
        return ApiError.authError;
      case 404:
        return ApiError.noDataError;
      case 500:
      case 501:
      case 502:
      case 503:
        return ApiError.serverError;
      default:
        return ApiError.unknownError;
    }
  }
}

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
}
