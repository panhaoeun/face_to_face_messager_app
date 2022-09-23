import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:face_to_face_messager_app/view/pages/chat_app/messager/conversation_list_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../domain/models/chat_message/chat_user.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationListAppState();
}

class _ConversationListAppState extends State<ConversationPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: 'Jane Willson',
        messageText: "Can't wait to try it out!",
        imageURL: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80',
        time: 'Now'),
    ChatUsers(name: 'Aillen Fulbright',
        messageText: 'Wow, this is really epic!',
        imageURL: 'https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80',
        time: 'Yesterday'),
    ChatUsers(name: 'Office Work!',
        messageText: 'Great job everyone!',
        imageURL: 'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGFraW5nJTIwcGhvdG98ZW58MHx8MHx8&w=1000&q=80',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRZkxDTYE2B85z8Zq5U4rsPxCfQ8JAjN4SzFMQ6RiEYErXxIMsDNCL4HYgkAaiuvdalM&usqp=CAU',
        time: 'Yesterday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            _buildArchivedChart(),
            _buildSaveMessage(),
            _buildConversation(),
          ],),
        )
    );
  }

  //-----------Archived Chart--------
  Widget _buildArchivedChart() {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildConverArchirved(),
              SizedBox(width: 10),
              _buildArchivedName()
            ],
          ),
        )
    );
  }
  Widget _buildConverArchirved() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBlue,
          border: Border.all(color: Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(0, 5),
                blurRadius: 25),
          ]),
      child: Stack(
        children: [
          Positioned.fill(
              child: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Iconsax.direct),
              )
          ),
        ],
      ),
    );
  }
  Widget _buildArchivedName() {
    return Expanded(
        child: Container(
          child:Padding(
            padding: EdgeInsets.only(top: 20, left: 5),
            child: Row(
              children: const [
                Text("Archived Charts", style: TextStyle(color: colorBlack, fontSize: 14, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        )
    );
  }
  //--------------Save Message------
  Widget _buildSaveMessage(){
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
        child: GestureDetector(
          onTap: () {
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildConverSaveMessage(),
              SizedBox(width: 10),
              _buildSaveMessageName()
            ],
          ),
        )
    );
  }
  Widget _buildConverSaveMessage() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBlue,
          border: Border.all(color: Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(0, 5),
                blurRadius: 25),
          ]),
      child: Stack(
        children: [
          Positioned.fill(
              child: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Iconsax.archive),
              )
          ),
        ],
      ),
    );
  }

  Widget _buildSaveMessageName(){
    return Expanded(
        child: Container(
          child:Padding(
            padding: EdgeInsets.only(top: 20, left: 5),
            child: Row(
              children: const [
                Text("Saved Message", style: TextStyle(color: colorBlack, fontSize: 14, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        )
    );
  }



  //---------------Build Conversation List---------------
  Widget _buildConversation() {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 2),
      physics: NeverScrollableScrollPhysics(),
      itemCount: chatUsers.length,
      itemBuilder: (context, index) {
        return ConversationListPage(
            name: chatUsers[index].name,
            messageText: chatUsers[index].messageText,
            imageURL: chatUsers[index].imageURL,
            isMessageRead: (index == 0 || index == 3) ? true : false,
            time: chatUsers[index].time
        );
      },
    );
  }
}
