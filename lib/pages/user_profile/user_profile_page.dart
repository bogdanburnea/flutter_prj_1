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
          child: ListView.separated(
              itemCount: 1,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    {
                      return SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            UserNameWidget(),
                          ],
                        ),
                      );
                    }

                  default:
                    {
                      return const SizedBox(
                        height: 50,
                        child: Center(child: Text(' ')),
                      );
                    }
                }
              })),
    );
  }
}
