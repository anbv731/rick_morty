import 'package:dio/dio.dart';

class DioSettings {
  static final mainServer = "https://rickandmortyapi.com/api/";

  // DioSettings() {
  //   initialSettings();
  // }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: mainServer,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  );

  initialSettings() {
    Interceptors interceptors = dio.interceptors;

    interceptors.requestLock.lock();
    interceptors.clear();
    interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.statusCode == 204) {
            throw DioError(
              error: "Отсутствуют данные",
              response: Response(
                statusCode: 204,
                requestOptions: response.requestOptions,
              ),
              requestOptions: response.requestOptions,
            );
          }
        },
        onError: (DioError error, handler) {
          if (error.type == DioErrorType.connectTimeout) {
            throw DioError(
              error: "Сервер не отвечает попробуйте еще раз",
              response: Response(
                statusCode: 400,
                requestOptions: error.requestOptions,
              ),
              requestOptions: error.requestOptions,
            );
          } else if (error.message.contains("SocketException:")) {
            throw DioError(
              error: "Отсутствует интернет соединение",
              response: Response(
                statusCode: 400,
                requestOptions: error.requestOptions,
              ),
              requestOptions: error.requestOptions,
            );
          } else if (error.response.statusCode == 401) {
            // ErrorHandler().showError(
            //   DioError(error: /*ErrorHandlerType.auth*/),
            // ); отображение ошибок
          }
          return error;
        },
      ),
    );
    interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    interceptors.requestLock.unlock();
  }
}
