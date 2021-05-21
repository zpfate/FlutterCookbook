import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class HttpClient {


  HttpClient._init() {

  }


  static final HttpClient _httpClient = HttpClient.i;


}