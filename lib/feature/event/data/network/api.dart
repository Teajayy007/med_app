import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/application/providers.dart';
import 'package:med_event_app/utils/exceptions.dart';

///provider for [Api] service class.
final apiProvider = Provider<Api>((ref) => Api(ref));

///[Api] is a simple service class that makes http request and resturns [Response] object.
///
///Only [Get] request has been implemented
class Api {
  final Ref _ref;
  Api(this._ref);

  Future<Response> get(String path) async {
    try {
      final response = await _ref.read(httpProvider).get(path);
      if (response.statusCode != 200) {
        throw FetchDataException();
      }
      return response;
    } on DioError {
      throw FetchDataException();
    } catch (e) {
      rethrow;
    }
  }
}
