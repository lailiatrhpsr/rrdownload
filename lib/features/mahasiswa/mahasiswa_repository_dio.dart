import 'package:dio/dio.dart';
import 'package:rrdownload/features/mahasiswa/mahasiswa_model.dart';

class MahasiswaRepositoryDio {
  final Dio _dio = Dio();

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/comments');
    final List<dynamic> data = response.data;
    return data.map((json) => MahasiswaModel.fromJson(json)).toList();
  }
}
