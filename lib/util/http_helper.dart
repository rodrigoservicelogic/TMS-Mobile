import 'package:dio/dio.dart';

class Http {
  Dio dio = Dio();

  Http();

  Future<Response> post(String url, Map body) async {
    Response response = await dio
        .post(url,
            options: Options(headers: {'Accept': 'application/json'}),
            data: body)
        .catchError((error) {
      throw error;
    });

    return response;
  }

  Future<Response> postDynamic(String url, dynamic body) async {
    Response response = await dio
        .post(url,
            options: Options(headers: {'Accept': 'application/json'}),
            data: body)
        .catchError((error) {
      throw error;
    });

    return response;
  }

  Future<Response> postFormData(String url, FormData body) async {
    Response response = await dio
        .post(url,
            options: Options(headers: {'Accept': 'application/json'}),
            data: body)
        .catchError((error) {
      throw error;
    });

    return response;
  }

  Future<Response> put(String url, {Map<String, dynamic> body}) async {
    Response response = await dio
        .put(url,
            options: Options(headers: {'Accept': 'application/json'}),
            data: body)
        .catchError((error) {
      throw error;
    });

    return response;
  }

  Future<Response> putFormData(String url, FormData body) async {
    Response response = await dio
        .put(url,
            options: Options(headers: {'Accept': 'application/json'}),
            data: body)
        .catchError((error) {
      throw error;
    });

    return response;
  }

  Future<Response> get(String url, {Map dados}) async {
    Response response = await dio.get(url).catchError((error) {
      throw error;
    });

    return response;
  }

  Future<Response> delete(String url) async {
    Response response = await dio.delete(url,
        options: Options(headers: {'Accept': 'application/json'}));

    return response;
  }
}
