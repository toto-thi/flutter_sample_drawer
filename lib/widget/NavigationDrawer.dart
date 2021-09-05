import 'package:flutter/material.dart';
import 'package:test_navigator/pages/FavoritePage.dart';
import 'package:test_navigator/pages/WorkFlow.dart';
import 'package:test_navigator/pages/people_page.dart';
import 'package:test_navigator/pages/updatePage.dart';
import 'package:test_navigator/pages/UserPage.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  //const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = "Toto";
    final String email = "toto@toto.com";
    final String urlImg = "https://images.unsplash.com/photo-1588731247530-4076fc99173e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          // padding: padding,
          children: [
            buildHeader(
                urlImg: urlImg,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UserPage(name: name, urlImg: urlImg)))),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildSearchBox(),
                  buildMenuItem(
                    text: "People",
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    text: "Favorite",
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    text: "WorkFlow",
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    text: "Update",
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  buildMenuItem(
                      text: "Plugin", icon: Icons.account_tree_outlined),
                  SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                      text: "Notification", icon: Icons.notifications_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hovercolor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hovercolor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PeoplePage()));
        break;

      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FavoritePage()));
        break;

      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WorkFlow()));
        break;

      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UpdatePage()));
        break;
    }
  }

  Widget buildHeader(
          {required String urlImg,
          required String name,
          required String email,
          required Future Function() onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(urlImg),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(
                  Icons.add_comment_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  Widget buildSearchBox() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}
