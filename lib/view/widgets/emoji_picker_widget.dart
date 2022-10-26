import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class EmojiPickerWidget extends StatelessWidget {
  final ValueChanged<String> onEmojiSelected;

  const EmojiPickerWidget({
    required this.onEmojiSelected,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return EmojiPicker(
     config: Config(
       columns: 7,
       emojiSizeMax: 32 *
           (!foundation.kIsWeb && Platform.isIOS ? 1.30 : 1.0),
       verticalSpacing: 0,
       horizontalSpacing: 0,
       gridPadding: EdgeInsets.zero,
       initCategory: Category.RECENT,
       indicatorColor: Colors.blue,
       iconColor: Colors.grey,
       iconColorSelected: Colors.blue,
       backspaceColor: Colors.blue,
       skinToneDialogBgColor: Colors.white,
       skinToneIndicatorColor: Colors.grey,
       enableSkinTones: true,
       showRecentsTab: true,
       recentsLimit: 28,
       replaceEmojiOnLimitExceed: false,
       buttonMode: ButtonMode.MATERIAL,
       checkPlatformCompatibility: true,
     )
   );
  }
}