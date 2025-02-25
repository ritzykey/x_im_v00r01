import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

enum TextSize { def, small, large }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  TextSize calendarView = TextSize.def;

  TextSize _selectedSize = TextSize.def; // Başlangıçta varsayılan seçili

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: const BoxConstraints(
        minWidth: 62,
        minHeight: 48,
        maxWidth: 62,
      ), // Butonları küçült
      borderRadius: BorderRadius.circular(8), // Kenar yuvarlama
      borderColor: Colors.grey, // Kenarlık rengi
      selectedBorderColor: Colors.blue, // Seçili segmentin kenarlık rengi
      color: context.general.textTheme.displaySmall?.color, // Yazı rengi
      selectedColor: Colors.blue, // Seçili yazı rengi
      fillColor: Colors.transparent,
      isSelected: [
        _selectedSize == TextSize.def,
        _selectedSize == TextSize.small,
        _selectedSize == TextSize.large,
      ],
      onPressed: (int index) {
        if (index == 0) {
          context.read<ProductViewModel>().setTextSize(12);
        }
        if (index == 1) {
          context.read<ProductViewModel>().setTextSize(10);
        }
        if (index == 2) {
          context.read<ProductViewModel>().setTextSize(16);
        }

        setState(() {
          _selectedSize = TextSize.values[index]; // Seçilen değeri güncelle
        });
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'settings.default'.tr(),
            style: context.general.appTheme.textTheme.bodySmall
                ?.copyWith(fontSize: 10),
          ),
        ),
        Text(
          'settings.small'.tr(),
          style: context.general.appTheme.textTheme.bodySmall,
        ),
        Text(
          'settings.large'.tr(),
          style: context.general.appTheme.textTheme.bodySmall,
        ),
      ], // Seçili arka plan rengi
    );
  }
}
