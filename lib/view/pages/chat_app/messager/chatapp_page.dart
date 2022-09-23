import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:face_to_face_messager_app/view/pages/chat_app/calling/calling_list.dart';
import 'package:face_to_face_messager_app/view/pages/chat_app/messager/coversation_page.dart';
import 'package:face_to_face_messager_app/view/widgets/popup/popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../domain/models/popup/popup_menu_button.dart';



class MessengerList extends StatefulWidget {
  const MessengerList({Key? key}) : super(key: key);

  @override
  State<MessengerList> createState() => _MessengerListState();
}

class _MessengerListState extends State<MessengerList> {
  List<PopupMenuButtonModel> listPopupMenuButton = [
    PopupMenuButtonModel(title: 'New Group', position: 0, iconData: Iconsax.user),
    PopupMenuButtonModel(title: 'New Broadcast', position: 1, iconData: Iconsax.activity),
    PopupMenuButtonModel(title: 'Invite Friend', position: 2, iconData: Iconsax.user_octagon),
    PopupMenuButtonModel(title: 'Setting', position: 3, iconData: Iconsax.setting),
  ];

  int _selectedIndex = 0;
  late Widget _selectedWidget;

  @override
  void initState(){
    _selectedWidget = const ConversationPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: DiamondBottomNavigation(
        height: 70,
        selectedColor: Colors.blue,
        unselectedColor: Colors.black38,
        selectedLightColor: colorBlue,
        itemIcons: const [
          Iconsax.message_notif,
          Iconsax.call,
          Iconsax.profile_2user,
          Iconsax.menu,
        ],
        centerIcon: Iconsax.message_programming,
        selectedIndex: _selectedIndex,
        onItemPressed: onPressed,
      ),
    );
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = ConversationPage();
      } else if (index == 1) {
        _selectedWidget = const CallingListPage();
      }
    });
  }

  //Build AppBar
  Widget _buildBody(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //App Bar
          Container(
            width: 500,
            height: 110,
            color: colorBlue,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Stack(
                children: [
                  Positioned(
                      child: Text(
                        "Agora",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      top: 65,
                      left: 10),
                  Positioned(
                    top: 50,
                    right: 2,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.search_normal_14,
                              color: Colors.white,
                            )),
                        //Menu Button
                        PopupMenuButtonPage(title: listPopupMenuButton[0].title, iconData: listPopupMenuButton[0].iconData, position: listPopupMenuButton[0].position),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child:_selectedWidget, flex: 1,),
        ],
      ),
    );
  }
}
