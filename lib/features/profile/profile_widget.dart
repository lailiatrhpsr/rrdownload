import 'package:flutter/material.dart';
import 'package:rrdownload/features/profile/profile_model.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel profile;
  final VoidCallback? onTap;

  const ProfileCard({
    Key? key,
    required this.profile,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // <-- sekarang bisa dipencet
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile.nama,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              Text('Email: ${profile.email}'),
              const SizedBox(height: 4),
              Text('Jurusan: ${profile.jurusan}'),
              const SizedBox(height: 4),
              Text('Angkatan: ${profile.angkatan}'),
            ],
          ),
        ),
      ),
    );
  }
}
