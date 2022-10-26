import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:face_to_face_messager_app/domain/models/chat_message/chart_detail/voice_message_page.dart';
import 'package:flutter/material.dart';
import '../../../../../common/standard_font.dart';
import '../../../../../domain/models/chat_message/chart_detail/chat_message.dart';

class CommentReplyDetail extends StatefulWidget {
  const CommentReplyDetail({Key? key}) : super(key: key);

  @override
  State<CommentReplyDetail> createState() => _CommentReplyDetailState();
}

class _CommentReplyDetailState extends State<CommentReplyDetail> {
  @override
  //Controller
  final ScrollController _scrollController = ScrollController();
  //==========Chart Messages============
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello, Will", messageType: "receiver", voice: ''),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        voice: 'https://d1qg6pckcqcdk0.cloudfront.net/chrgold/kajagoogoo_ch0331_tooshy.m4a'),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        voice: 'https://d1qg6pckcqcdk0.cloudfront.net/chrgold/kajagoogoo_ch0331_tooshy.m4a'),
    ChatMessage(
        messageContent: "ehhhh, doing OK.", messageType: "receiver", voice: ''),
    ChatMessage(
        messageContent: "ehhhh, doing OK.", messageType: "receiver", voice: ''),
  ];

  Widget build(BuildContext context) {
    return _bulidListViewComment();
  }

  Widget _bulidListViewComment() {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      clipBehavior: Clip.hardEdge,
      scrollDirection: Axis.vertical,
      itemCount: messages.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 5),
          child: Column(
            children: [
              Align(
                alignment: (messages[index].messageType == "receiver"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(250),
                        topRight: Radius.circular(200),
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(200)),
                    color: (messages[index].messageType == "receiver"
                        ? colorGrey
                        : colorBlue),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text Message
                      Text(messages[index].messageContent,
                          style: messages[index].messageType == "receiver"
                              ? fontNormal
                              : fontNormalWhite),
                    ],
                  ),
                ),
              ),
              //Voice Message
             VoiceMessagePage(messageType: messages[index].messageType),
            ],
          ),
        );
      },
    );
  }
}
