import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/user_profile/widgets/user_name_widget.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    print('[UserProfilePage] build');
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 55,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const UserNameWidget(),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Divider(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
