import 'package:apps_kulineran/data/models/user_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:8000/api'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/wisata-kuliner');
    return DataUser.formJson(response.data);
  }
}
