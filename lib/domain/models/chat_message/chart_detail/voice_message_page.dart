import 'package:flutter/material.dart';

class VoiceMessagePage extends StatefulWidget {
  String messageType;
  VoiceMessagePage({required this.messageType,Key? key}) : super(key: key);

  @override
  State<VoiceMessagePage> createState() => _VoiceMessagePageState();
}

class _VoiceMessagePageState extends State<VoiceMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: widget.messageType == "receiver" ? Alignment.topLeft : Alignment.topRight,
        child: Text("Voice Message"),
      ),
    );
  }
}
