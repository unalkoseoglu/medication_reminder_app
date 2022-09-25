import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

import '../init/theme/app_theme_light.dart';
import 'button/custom_elevated_button.dart';

Future<dynamic> customBottomSheet(BuildContext context,
    {void Function()? removeReminder, void Function()? takePill}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Stack(clipBehavior: Clip.none, children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20))),
              height: context.height(0.25),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Spacer(),
                      Expanded(flex: 2, child: _removeButton(removeReminder)),
                      const Spacer(),
                      Expanded(flex: 2, child: _takeButton(takePill))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: context.height(0.21),
            right: context.width(0.03),
            child: _closeButton(context)),
      ]);
    },
  );
}

FloatingActionButton _closeButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: AppThemeLight.instance.colorSchemeLight?.ultraRed,
    mini: true,
    onPressed: () {
      context.router.pop();
    },
    child: const Icon(Icons.close),
  );
}

MyElevatedButton _takeButton(void Function()? takePill) {
  return MyElevatedButton(
      color: AppThemeLight.instance.colorSchemeLight?.jamaicanJade,
      onPressed: takePill,
      child: const Center(child: Text('Take')));
}

MyElevatedButton _removeButton(void Function()? removeReminder) {
  return MyElevatedButton(
      color: AppThemeLight.instance.colorSchemeLight?.heartFelt,
      onPressed: removeReminder,
      child: const Center(child: Text('Remove')));
}
