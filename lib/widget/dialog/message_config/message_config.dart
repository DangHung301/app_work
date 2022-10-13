import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/image.dart';
import 'package:recruit_app/widget/dialog/message_config/mess_dialog_pop_up.dart';

enum MessState { error, success, customIcon }

class MessageConfig {
  static BuildContext? contextConfig;
  static OverlayEntry? _overlayEntry;
  static void init(BuildContext context) {
    if (contextConfig != null) {
      return;
    }
    contextConfig = context;
  }

  static void show({
    String title = '',
    String title2 = '',
    bool? showTitle2 = false,
    FontWeight? fontWeight,
    double? fontSize,
    String urlIcon = '',
    MessState messState = MessState.success,
    Function()? onDismiss,
  }) {
    if (_overlayEntry != null) {
      return;
    }
    final OverlayState? overlayState = Overlay.of(contextConfig!);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return MessageDialogPopup(
          onDismiss: () {
            _overlayEntry?.remove();
            _overlayEntry = null;
            if (onDismiss != null) {
              onDismiss();
            }
          },
          urlIcon: _urlIcon(messState, urlIcon),
          title: title,
          showTitle2: showTitle2,
          title2: title2,
          fontSize: fontSize ?? 18.0,
          fontWeight: fontWeight ?? FontWeight.w500,
        );
      },
    );

    overlayState?.insert(_overlayEntry!);
  }

  static String _urlIcon(MessState messState, String urlIcon) {
    switch (messState) {
      case MessState.error:
        return ImageAssets.icError;
      case MessState.success:
        return ImageAssets.icSucces;
      case MessState.customIcon:
        return urlIcon;
    }
  }
}
