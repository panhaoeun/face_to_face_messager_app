import 'package:camera/camera.dart';
import 'package:face_to_face_messager_app/view/widgets/camera/take_picture_by_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmojiVisible;
  final bool isKeyboardVisible;
  final Function onBlurred;
  final ValueChanged<String> onSentMessage;
  final focusNode = FocusNode();

  InputWidget({
    required this.controller,
    required this.isEmojiVisible,
    required this.isKeyboardVisible,
    required this.onSentMessage,
    required this.onBlurred,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 0.5,
        style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.all(Radius.circular(50))
    ),
    child: Row(
      children: <Widget>[
        buildEmoji(),
        Expanded(child: buildTextField()),
        _buildCameraVoice(context),
        buildSend(),
      ],
    ),
  );

  Widget buildEmoji() => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    child: IconButton(
      icon: Icon(
        isEmojiVisible
            ? Iconsax.keyboard
            : Iconsax.emoji_happy,
      ),
      onPressed: onClickedEmoji,
    ),
  );

  Widget buildTextField() => TextField(
    focusNode: focusNode,
    controller: controller,
    style: TextStyle(fontSize: 16),
    decoration: InputDecoration.collapsed(
      hintText: 'Type your message...',
      hintStyle: TextStyle(color: Colors.grey),
    ),
  );

  Widget _buildCameraVoice(context){
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            InkWell(child: Icon(Iconsax.camera), onTap: ()async {
              await availableCameras().then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (_) => TakePictureByCamera(camera: value))
              ));
            },),
            SizedBox(width: 10),
            InkWell(child: Icon(Iconsax.microphone), onTap: (){},),
        ],
      ),
    );
  }

  Widget buildSend() => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    child: IconButton(
      icon: Icon(Icons.send),
      onPressed: () {
        if (controller.text.trim().isEmpty) {
          return;
        }
        onSentMessage(controller.text);
        controller.clear();
      },
    ),
  );

  // Hide/Show Emoji
  void onClickedEmoji() async {
    if (isEmojiVisible) {
      focusNode.requestFocus();
    } else if (isKeyboardVisible) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(Duration(milliseconds: 100));
    }
    onBlurred();
  }
}