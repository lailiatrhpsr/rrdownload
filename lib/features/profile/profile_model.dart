class ProfileModel {
  final String nama;
  final String email;
  final String jurusan;
  final String angkatan;

  ProfileModel({
    required this.nama,
    required this.email,
    required this.jurusan,
    required this.angkatan,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      angkatan: json['angkatan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'jurusan': jurusan,
      'angkatan': angkatan,
    };
  }
}
