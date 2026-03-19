import 'package:dio/dio.dart';
import 'package:rrdownload/features/dosen/data/models/dosen_model.dart';

class DosenRepositoryDio {
  final Dio _dio = Dio();

  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // response.data sudah otomatis di-decode jadi Map/List
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Gagal memuat data dosen dengan Dio: $e');
    }
  }
}
