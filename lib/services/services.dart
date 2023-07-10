import 'package:chatgpt_pfxa/constants/constants.dart';
import 'package:chatgpt_pfxa/widgets/drop_down.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModelSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: 'chosen Model:',
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ModelsDrowDownWidget(),
                ),
              ],
            ),
          );
        });
  }
}
