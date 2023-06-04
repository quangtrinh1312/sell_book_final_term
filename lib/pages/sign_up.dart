import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../models/account.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key,required this.accounts});
  final List<Account> accounts;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  String userNameMess = 'Enter username';
  String passWordMess = 'Password';
  String rePassWordMess = 'Re password';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Singup',
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
                      'Password',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Spacer(),
                  ],
                ),
                
                TextFieldCustom(
                  controller: passwordController,
                  icon: const Icon(Icons.ac_unit),
                  hintText: passWordMess,
                  isPassWord: true,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Row(
                  children: [
                    Text(
                      'Re password',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Spacer(),
                  ],
                ),
                
                TextFieldCustom(
                  controller: rePasswordController,
                  icon: const Icon(Icons.ac_unit),
                  hintText: rePassWordMess,
                  isPassWord: true,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                ButtonCustom(
                  onPress: () {
                    if (usernameController.text.isEmpty) {
                      userNameMess = 'Please input user name';
                      SnackBar snackBar = const SnackBar(
                          content: Text('Please input user name'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if (passwordController.text.isEmpty) {
                      passWordMess = 'please input password';
                    }
                    else if(rePasswordController.text.isEmpty){
                      rePassWordMess = 'please input re password';
                    }
                    else if (passwordController.text != rePasswordController.text) {
                      SnackBar snackBar = const SnackBar(
                          content: Text('Password and re password not match'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      bool isExist = false;
                      for (int i = 0; i < widget.accounts.length; i++) {
                        if (usernameController.text == widget.accounts[i].username) {
                          isExist = true;
                          break;
                        }
                      }
                      if (isExist) {
                        SnackBar snackBar = const SnackBar(
                          content: Text('User name already exist!!!!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        
                      } else {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Sign up success!!!!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Account account = Account(
                            username: usernameController.text,
                            password: passwordController.text);
                        Navigator.pop(context, account);
                      }
                    }
                  },
                  text: 'Singup',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'back to login',
                style: TextStyle(color: Colors.brown[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
