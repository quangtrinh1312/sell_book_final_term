import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  final String username;
  const ChangePasswordPage({
    super.key,
    required this.username,
  });

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String userNameMess = 'Username';
  String passWordMess = 'Enter current password';
  String newPassWordMess = 'Enter new password';
  String confirmPassWordMess = 'Enter confirm Password';

@override
  void initState() {
    super.initState();
    usernameController.text = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Forgot password',
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Spacer(),
                    ],
                  ),
                  TextFieldCustom(
                    controller: usernameController,
                    icon: const Icon(Icons.accessibility),
                    hintText: userNameMess,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Enter current password',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Spacer(),
                    ],
                  ),
                  TextFieldCustom(
                    controller: currentPasswordController,
                    icon: const Icon(Icons.accessibility),
                    hintText: passWordMess,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Row(
                    children: [
                      Text(
                        'New password',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Spacer(),
                    ],
                  ),
                  TextFieldCustom(
                    controller: newPasswordController,
                    icon: const Icon(Icons.accessibility),
                    hintText: newPassWordMess,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Row(
                    children: [
                      Text(
                        'New password',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Spacer(),
                    ],
                  ),
                  TextFieldCustom(
                    controller: confirmPasswordController,
                    icon: const Icon(Icons.accessibility),
                    hintText: confirmPassWordMess,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ButtonCustom(
                    onPress: () {
                      // if (usernameController.text.isEmpty) {
                      //   userNameMess = 'Please input user name';
                      //   SnackBar snackBar = const SnackBar(
                      //       content: Text('Please input user name'));
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // } else {
                      //   if (currentPasswordController.text.isEmpty ||
                      //       newPasswordController.text.isEmpty ||
                      //       confirmPasswordController.text.isEmpty) {
                      //     passWordMess = 'please input password';
                      //     SnackBar snackBar =
                      //         SnackBar(content: Text(passWordMess));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   }
                      //   if (newPasswordController.text.isEmpty) {
                      //     passWordMess = 'please input password';
                      //   } else if ((currentPasswordController.text ==
                      //       newPasswordController.text)) {
                      //     SnackBar snackBar = const SnackBar(
                      //         content: Text('Password current and new password can\'t match'));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   } else if(currentPasswordController.text == Authen.password){
                      //     SnackBar snackBar =
                      //         const SnackBar(content: Text('success!'));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //     Navigator.pop(context, usernameController.text);
                      //   }else{
                      //     SnackBar snackBar =
                      //         const SnackBar(content: Text('Current password not correct!'));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   }
                      //   setState(() {});
                        
                      // }
                    },
                    text: 'next',
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                    width: 150,
                    height: 40,
                    backgroundColor: Colors.blue,
                    radius: 6.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
