import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rrdownload/core/widgets/common_widgets.dart';
import 'package:rrdownload/features/mahasiswa_aktif/mahasiswa_aktif_provider.dart';
import 'package:rrdownload/features/mahasiswa_aktif/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaAktifState = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(mahasiswaAktifNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: mahasiswaAktifState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa aktif: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaAktifNotifierProvider.notifier).refresh();
          },
        ),
        data: (mahasiswaAktifList) {
          return ListView.builder(
            itemCount: mahasiswaAktifList.length,
            itemBuilder: (context, index) {
              final mhsAktif = mahasiswaAktifList[index];
              return MahasiswaAktifCard(
                mahasiswaAktif: mhsAktif,
                onTap: () {
                  // TODO: Navigasi ke detail mahasiswa aktif
                },
              );
            },
          );
        },
      ),
    );
  }
}
