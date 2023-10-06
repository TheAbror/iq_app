// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:iq_app/core/api/custom_converter.dart';

class ApiProvider {
  static late ChopperClient _client;
  // static late AuthService authService;

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        // AuthService.create(),
      ],
      interceptors: getInterceptors(token),
      converter: CustomDataConverter(),
    );

    // authService = _client.getService<AuthService>();
  }

  static List getInterceptors(token) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(HeadersInterceptor({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
    }));

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
