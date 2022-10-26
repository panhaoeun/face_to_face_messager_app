import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:face_to_face_messager_app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../widgets/input_widget.dart';

class ChartInputField extends StatefulWidget {
  const ChartInputField({Key? key}) : super(key: key);

  @override
  State<ChartInputField> createState() => _ChartInputFieldState();
}

class _ChartInputFieldState extends State<ChartInputField> {

  final messages = <String>[];
  final controller = TextEditingController();
  bool isEmojiVisible = false;
  bool isKeyboardVisible = false;


  var keyboardVisibilityController = KeyboardVisibilityController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyboardVisibilityController.onChange.listen((bool isKeyboardVisible) {
        setState(() {
          this.isKeyboardVisible = isKeyboardVisible;
        });
        if(isKeyboardVisible && isEmojiVisible){
          isEmojiVisible = false;
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding, vertical: kDefaultPadding / 1),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08),
              ),
            ]),
        child: WillPopScope(
        onWillPop: onBackPress,
        child: Column(
          children: <Widget>[
            InputWidget(
              onBlurred: toggleEmojiKeyboard,
              controller: controller,
              isEmojiVisible: isEmojiVisible,
              isKeyboardVisible: isKeyboardVisible,
              onSentMessage: (message) =>
                  setState(() => messages.insert(0, message)),
            ),
            //Show Input Emoji
            Offstage(
              offstage: !isEmojiVisible,
              child:EmojiPicker(
                onEmojiSelected: (Category? category, Emoji emoji) {
                  onEmojiSelected(emoji.emoji);
                },
                onBackspacePressed: () {
                },
                config: Config(
                  columns: 2,
                  emojiSizeMax: 20 * (Platform.isIOS ? 1.30 : 1.0),
                  loadingIndicator: const SizedBox.shrink(),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                ),
              ),
            ),
            //Show/Hide Send to Message
            Visibility(
              child: InkWell(
                child: Text("Send Message"),
                onTap: (){
                  print(controller.text);
                },
              )
            ),
          ],
        ),
      ),
    );
  }

  //Function check input filed
  Future toggleSendMessage() async {

  }

  //Show/Hide Emoji Input Filed
  void onEmojiSelected(String emoji) => setState(() {
    controller.text = controller.text + emoji;
  });

  Future toggleEmojiKeyboard() async {
    if (isKeyboardVisible) {
      FocusScope.of(context).unfocus();
    }

    setState(() {
      isEmojiVisible = !isEmojiVisible;
    });
  }

  Future<bool> onBackPress() {
    if (isEmojiVisible) {
      toggleEmojiKeyboard();
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }
}
