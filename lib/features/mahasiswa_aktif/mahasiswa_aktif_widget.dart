import 'package:flutter/material.dart';
import 'package:rrdownload/features/mahasiswa_aktif/mahasiswa_aktif_model.dart';

class MahasiswaAktifCard extends StatelessWidget {
  final MahasiswaAktifModel mahasiswaAktif;
  final VoidCallback? onTap;

  const MahasiswaAktifCard({Key? key, required this.mahasiswaAktif, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mahasiswaAktif.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                mahasiswaAktif.body,
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaAktifListView extends StatelessWidget {
  final List<MahasiswaAktifModel> mahasiswaAktifList;
  final VoidCallback onRefresh;

  const MahasiswaAktifListView({
    Key? key,
    required this.mahasiswaAktifList,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mahasiswaAktifList.isEmpty) {
      return Center(child: Text("Tidak ada data mahasiswa aktif"));
    }

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mahasiswaAktifList.length,
        itemBuilder: (context, index) {
          final mahasiswaAktif = mahasiswaAktifList[index];
          return MahasiswaAktifCard(
            mahasiswaAktif: mahasiswaAktif,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Detail: ${mahasiswaAktif.title}')),
              );
            },
          );
        },
      ),
    );
  }
}