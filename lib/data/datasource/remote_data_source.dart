import 'package:apps_kulineran/data/models/user_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/users');
    return DataUser.formJson(response.data);
  }
}
