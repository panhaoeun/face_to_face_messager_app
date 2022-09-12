import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../onboarding/onboarding_page.dart';
import '../register/faceId/face_id_main_page.dart';

class MessengerList extends StatefulWidget {
  const MessengerList({Key? key}) : super(key: key);

  @override
  State<MessengerList> createState() => _MessengerListState();
}

class _MessengerListState extends State<MessengerList> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: DiamondBottomNavigation(
        height: 60,
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
        _selectedWidget = const onBoardingPage();
      } else if (index == 1) {
        _selectedWidget = const FaceIdMainPage();
      }
    });
  }

  //Build AppBar
  Widget _buildBody() {
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
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.search_normal_14,
                              color: Colors.white,
                            )),
                        _offsetPopup()
                      ],
                    ),
                    top: 50,
                    right: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _offsetPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.profile_2user,
                              color: colorBlack,
                            ))),
                    Text("New Group")
                  ],
                ),
              )),
        ],
        icon: Icon(
          Iconsax.more_circle,
          color: Colors.white,
        ),
        offset: Offset(0, 50),
      );
}
