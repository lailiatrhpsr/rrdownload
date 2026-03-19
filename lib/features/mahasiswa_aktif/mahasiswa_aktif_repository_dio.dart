import 'package:dio/dio.dart';
import 'mahasiswa_aktif_model.dart';

class MahasiswaAktifRepositoryDio {
  final Dio _dio = Dio();

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    final List<dynamic> data = response.data;
    return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
  }
}
