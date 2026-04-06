import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rrdownload/features/mahasiswa/mahasiswa_model.dart';
import 'package:rrdownload/features/mahasiswa/mahasiswa_repository.dart';
import '../../../../core/services/local_storage_service.dart';
import 'package:rrdownload/features/dosen/presentation/provider/dosen_provider.dart';

final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

class MahasiswaNotifier extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this._repository, this._storage) : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() => loadMahasiswaList();

  // Method Simpan [cite: 188-191]
  Future<void> saveSelectedMahasiswa(MahasiswaModel mhs) async {
    await _storage.addUserToSavedList(
      userId: mhs.id.toString(),
      username: mhs.name,
    );
  }

  // Method Hapus Satuan (INI YANG TADI HILANG) [cite: 193-195]
  Future<void> removeSavedUser(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  // Method Hapus Semua (INI JUGA YANG TADI HILANG) [cite: 197-198]
  Future<void> clearSavedUsers() async {
    await _storage.clearSavedUsers();
  }
}

final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<MahasiswaNotifier, AsyncValue<List<MahasiswaModel>>>((ref) {
  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage = ref.watch(localStorageServiceProvider);
  return MahasiswaNotifier(repository, storage);
});
