import 'package:dio/dio.dart';
import '../../features/auth/cubits/auth_cubit.dart';
import '../routes/go_router.dart';
import '../routes/named_routes.dart';
import 'injection_container.dart';

class AppInterceptor extends QueuedInterceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  late Map<String, String> headers;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${getIt<AuthCubit>().getToken()}',
    };

    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
  @override
  void onError(DioException err,ErrorInterceptorHandler handler){
    if(err.response?.statusCode==401){
      goRouter.go(NamedRoutes.signup);
    }
    handler.next(err);
    super.onError(err, handler);
  }
}
