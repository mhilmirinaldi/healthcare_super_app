import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';

class JadwalCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isEnable;
  final bool isDate;

  const JadwalCard(
      {super.key,
      required this.text,
      this.onTap,
      this.isSelected = false,
      this.isEnable = true,
      this.isDate = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isEnable ? onTap : null,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: isSelected ? primaryColor.withOpacity(0.1) : null,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? primaryColor
                    : isEnable
                        ? Colors.grey
                        : Colors.grey.withOpacity(0.3),
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: isSelected
                      ? primaryColor
                      : isEnable
                          ? Colors.black
                          : Colors.grey[300],
                  fontSize: 13.5),
            ),
          ),
        ));
  }
}
