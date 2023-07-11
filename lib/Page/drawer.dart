import 'package:apobat/Component/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onAboutTap;
  final void Function()? onHelpTap;
  const MyDrawer({
    super.key,
    required this.onAboutTap,
    required this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[200],
      child: Column(
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
    );
  }
}
