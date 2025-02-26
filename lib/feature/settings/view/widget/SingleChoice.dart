import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/product/state/view_model/product_state.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

enum TextSize { def, small, large }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  TextSize calendarView = TextSize.def;

  final TextSize _selectedSize = TextSize.def; // Başlangıçta varsayılan seçili

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      builder: (context, state) {
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
            state.fontSize == 12.0,
            state.fontSize == 10.0,
            state.fontSize == 16.0,
          ],
          onPressed: (int index) {
            final sizes = [12.0, 10.0, 16.0];
            context.read<ProductViewModel>().setTextSize(sizes[index]);
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
      },
    );
  }
}
