import 'package:instagramridwan/ui/page/user/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/image/collection_controller.dart';
import '../../../controller/user_controller.dart';
import '../widget/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, title: 'Profile'),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<UserController>(builder: (context, user, child) {
        return Visibility(
            visible: user.isLogin,
            replacement: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    SizedBox(
                        width: 75,
                        height: 75,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'))),
                  ]),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    'Hi Muhammad Ridwan Maulana, Login to access more feature!',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      user.login();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: ProfileWidget());
      }),
    );
  }
}
