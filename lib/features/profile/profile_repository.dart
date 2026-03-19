import 'package:rrdownload/features/profile/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return ProfileModel(
      nama: 'Lailia Putri',
      email: 'lailia.putri@example.com',
      jurusan: 'Teknik Informatika',
      angkatan: '2023',
    );
  }
}
