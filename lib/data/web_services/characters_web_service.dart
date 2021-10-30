import 'package:dio/dio.dart';
import 'package:breaking_bad_flutter_bloc/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //20second
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQuotes(String characterName) async {
    try {
      Response response =
          await dio.get('quote', queryParameters: {'author': characterName});
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
