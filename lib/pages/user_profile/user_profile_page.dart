import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/user_profile/widgets/user_edit_dialog.dart';
import 'package:flutter_prj_1/state/managers/user_profile_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/constants.dart';
import 'package:username_gen/username_gen.dart';
import 'package:flutter_html/flutter_html.dart';

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

    final userProfileStateManager = getIt<UserProfileStateManager>();

    return ValueListenableBuilder<String>(
        valueListenable: userProfileStateManager.userStateNotifier,
        builder: (context, userName, child) {
          print('[UserProfilePage] build, userName: $userName');
          return Scaffold(
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 55,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text('User Name'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(userName),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: const Divider(color: Colors.grey),
                  ),
                  Container(
                    height: 55,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // generate a random userName
                              String randomUsername =
                                  UsernameGen.generateWith();
                              // set the user state
                              userProfileStateManager
                                  .setUserName(randomUsername);
                            },
                            child: const Text('Random'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final String? newUser =
                                  await asyncUserEditDialog(context, userName);
                            },
                            child: const Text('Edit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: const Divider(color: Colors.grey),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child:

                    SafeArea(
                      child: SingleChildScrollView(
                        child: Html(
                          data: Constants.htmlData,
                          // Styling with CSS (not real CSS)
                          style: {
                            'h1': Style(color: Colors.red),
                            'p': Style(color: Colors.black87, fontSize: FontSize.medium),
                            'ul': Style(margin: const EdgeInsets.symmetric(vertical: 20))
                          },
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          );
        });
  }
}
