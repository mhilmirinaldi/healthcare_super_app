import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/jadwal_card.dart';

List<Widget> jadwalItem<T>({
  required List<T> jadwalItem,
  required T? selectedItem,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnable,
  required void Function(T object) onTap,
  required bool isDate,
}) =>
    [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: jadwalItem
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 0, right: 10),
                  child: JadwalCard(
                    text: converter != null ? converter(e) : e.toString(),
                    isSelected: e == selectedItem,
                    isEnable: isOptionEnable?.call(e) ?? true,
                    onTap: () => onTap(e),
                    isDate: isDate,
                    date: isDate ? e as DateTime : null,
                  ),
                ),
              )
              .toList(),
        ),
      )
    ];
