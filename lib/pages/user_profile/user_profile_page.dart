import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_prj_1/pages/user_profile/widgets/user_edit_dialog.dart';
import 'package:flutter_prj_1/state/managers/user_profile_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/constants.dart';
import 'package:username_gen/username_gen.dart';

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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5,
                          offset: Offset(5, 5), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 55,
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
                        SizedBox(
                          height: 55,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: const BorderSide(
                                                  color: Colors.blue)))),
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
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: const BorderSide(
                                                  color: Colors.blue)))),
                                  onPressed: () async {
                                    final String? newUser =
                                        await asyncUserEditDialog(
                                            context, userName);
                                  },
                                  child: const Text('Edit'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5,
                          offset: Offset(5, 5), // Shadow position
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        child: Html(
                          data: Constants.htmlData,
                          // Styling with CSS (not real CSS)
                          style: {
                            'h1': Style(color: Colors.red),
                            'p': Style(
                                color: Colors.black87,
                                fontSize: FontSize.medium),
                            'ul': Style(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20))
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
