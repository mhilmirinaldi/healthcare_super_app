import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_resep_obat_provider.dart';

class ChatRekamMedisCard extends ConsumerStatefulWidget {
  final Transaksi transaksi;
  final bool showCheckbox;
  final ValueChanged<bool?> onChanged;
  final bool isSelected;

  const ChatRekamMedisCard({
    super.key,
    required this.transaksi,
    this.showCheckbox = true,
    required this.onChanged,
    this.isSelected = false,
  });

  @override
  ConsumerState<ChatRekamMedisCard> createState() => _ChatRekamMedisCardState();
}

class _ChatRekamMedisCardState extends ConsumerState<ChatRekamMedisCard> {
  @override
  Widget build(BuildContext context) {
    // final kategoriFaskes = ref.watch(listRekomendasiFaskesProvider);
    final listResepObat = ref.watch(listResepObatProvider);

    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      widget.transaksi.kategori == 'chat'
                          ? Icons.wechat
                          : widget.transaksi.kategori == 'faskes'
                              ? Icons.add_location_rounded
                              : Icons.medical_services,
                      color: primaryColor,
                      size: widget.transaksi.kategori == 'obat' ? 15 : 17,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.transaksi.judul,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  widget.transaksi.kategori == 'faskes'
                      ? formatRiwayatChat(
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.transaksi.waktuJanji!),
                        )
                      : formatRiwayatChat(
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.transaksi.waktuTransaksi!),
                        ),
                ),
                if (widget.showCheckbox)
                  Checkbox(
                    value: widget.isSelected,
                    onChanged: widget.onChanged,
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                widget.transaksi.kategori == 'chat'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.transaksi.dokter!.nama,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Diagnosis',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'Alergi',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[800]),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Resep Obat',
                            style: TextStyle(fontSize: 15),
                          ),
                          listResepObat.when(
                            data: (obats) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: obats
                                    .map(
                                      (obat) => Text(
                                        '- ${obat.nama} ${obat.jumlah} pcs',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[800]),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (error, stackTrace) => Text(
                              error.toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      )
                    : widget.transaksi.kategori == 'faskes'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.transaksi.dokter!.tempatPraktik,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                widget.transaksi.dokter!.nama,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Diagnosis',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'Demam, Flu, Sakit Kepala',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[800]),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Resep Obat',
                                style: TextStyle(fontSize: 15),
                              ),
                              listResepObat.when(
                                data: (obats) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: obats
                                        .map(
                                          (obat) => Text(
                                            '- ${obat.nama} ${obat.jumlah} pcs',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[800]),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                error: (error, stackTrace) => Text(
                                  error.toString(),
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Daftar Obat',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              ...widget.transaksi.listObat!
                                  .map(
                                    (obat) => Text(
                                      '- ${obat.nama} ${obat.jumlah} pcs',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
