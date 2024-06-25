import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';

class JadwalCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isEnable;
  final bool isDate;
  final DateTime? date;

  const JadwalCard({
    super.key,
    required this.text,
    this.onTap,
    this.isSelected = false,
    this.isEnable = true,
    this.isDate = false,
    this.date,
  });

  String _formatDate(DateTime date) {
    // Menginisialisasi lokal bahasa Indonesia
    initializeDateFormatting('id', null);
    final DateFormat dayFormat = DateFormat.EEEE('id');
    final DateFormat dayShortFormat = DateFormat('d MMM', 'id');
    return '${dayFormat.format(date)}\n${dayShortFormat.format(date)}';
  }

  @override
  Widget build(BuildContext context) {
    final dateText = date != null ? _formatDate(date!) : text;
    final displayText = isDate ? dateText.split('\n') : [text];

    return GestureDetector(
      onTap: isEnable ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : isEnable
                    ? Colors.grey
                    : Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: displayText
                .map((line) => Text(
                      line,
                      style: TextStyle(
                        color: isSelected
                            ? primaryColor
                            : isEnable
                                ? Colors.black
                                : Colors.grey[300],
                        fontSize: 13.5,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
