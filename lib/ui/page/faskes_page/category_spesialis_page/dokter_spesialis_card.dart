import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/extension/str_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/search_jarak_faskes_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DokterSpesialisCard extends ConsumerStatefulWidget {
  final Dokter dokter;

  const DokterSpesialisCard({super.key, required this.dokter});

  @override
  _DokterSpesialisCardState createState() => _DokterSpesialisCardState();
}

class _DokterSpesialisCardState extends ConsumerState<DokterSpesialisCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchJarakFaskesProvider(widget.dokter.tempatPraktik)
          .notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final jarakState = ref.watch(searchJarakFaskesProvider(widget.dokter.tempatPraktik));

    return GestureDetector(
      onTap: () {
        ref.read(routerProvider).pushNamed('detail_dokter_faskes', extra: widget.dokter);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Container(
                  width: 85,
                  height: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1),
                    image: DecorationImage(
                      image: widget.dokter.gambar == null ||
                              widget.dokter.gambar!.isEmpty
                          ? widget.dokter.jenisKelamin == 'Laki-laki'
                              ? const AssetImage(
                                  'assets/default_profile_doctor_male.png')
                              : const AssetImage(
                                  'assets/default_profile_doctor_female.png')
                          : NetworkImage(widget.dokter.gambar!) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      widget.dokter.nama.capitalize(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.dokter.kategori,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const SizedBox(width: 1),
                        Text(
                          widget.dokter.ratingTotal.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.work, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.dokter.lamaKerja} Tahun',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    jarakState.when(
                      data: (jarak) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.dokter.tempatPraktik,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 14, color: primaryColor),
                              const SizedBox(width: 2),
                              Text(
                                '${jarak.toStringAsFixed(2)} km',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ],
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, _) => Text(
                        'Error: $error',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.dokter.harga.toIDRCurrency(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref.read(routerProvider).pushNamed('detail_dokter_faskes', extra: widget.dokter);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color(0xFFE1004E)),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 25),
                            ),
                            minimumSize:
                                WidgetStateProperty.all(const Size(0, 0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Pilih',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
