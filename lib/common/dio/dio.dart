import 'package:brawl_api/common/dio/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);
  dio.interceptors.add(CustomInterceptor(storage: storage));

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });

  // 1) 요청을 보낼 때
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    print('[REQ] [${options.method}] ${options.uri}');

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');
      final token = await storage.read(key: 'token');

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }
  }

  // 2) 응답을 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    // TODO: implement onResponse
    print('[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  // 3) 에러가 났을 때
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    print('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');
    print('[${err.response?.statusCode}] message: ${err.message}');

    final isStatus403 = err.response?.statusCode == 403;

    final dio = Dio();

    if(isStatus403){
      //await Future.delayed(Duration(seconds: 3));
      try{
        final options = err.requestOptions;
        final response = await dio.fetch(options);
        print('Its OK');
        return handler.resolve(response);
      }catch(e){
        print('cant solve');
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }
}
