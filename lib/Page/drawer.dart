import 'package:apobat/Component/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onAboutTap;
  final void Function()? onHelpTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onAboutTap,
    required this.onHelpTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              const DrawerHeader(
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 64,
                ),
              ),

              //about
              MyListTile(
                icon: Icons.feedback,
                text: 'A B O U T',
                onTap: onAboutTap,
              ),

              //help
              MyListTile(
                icon: Icons.help,
                text: 'H E L P',
                onTap: onHelpTap,
              ),

            ],
          ),
          //logout
         Padding(
             padding: const EdgeInsets.only(bottom: 25.0),
           child: MyListTile(
             icon: Icons.logout,
             text: 'L O G O U T',
             onTap: onSignOut,
           ),
         ),
        ],
      ),
    );
  }
}
