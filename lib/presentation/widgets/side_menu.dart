import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    Key? key, 
    required this.scaffoldKey
    }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value){

        navDrawerIndex = value;        
        setState(() {});

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children:[
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20,16,10),
          child: const Text("Main"),
        ),

        ...appMenuItems
          .sublist(0,3)
          .map((menuItem) => NavigationDrawerDestination(
            icon: Icon(menuItem.icon), 
            label: Text(menuItem.title)
          )
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10,16,10),
          child: Text("More Options"),
        ),

        ...appMenuItems
          .sublist(3)
          .map((menuItem) => NavigationDrawerDestination(
            icon: Icon(menuItem.icon), 
            label: Text(menuItem.title)
          )
        ),

      ]
    );
  }
}