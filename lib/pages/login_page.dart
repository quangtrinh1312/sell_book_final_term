import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../pages/sign_up.dart';
import './home_page.dart';
import '../components/custom_text_field.dart';
import '../models/account.dart';
import '../services/local/shared_prefs_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userNameMess = 'Enter username';
  String passWordMess = 'Password';
  final SharedPrefsAccount _sharedPrefsAccount = SharedPrefsAccount();
  List<Account> _accounts = [];
  @override
  void initState() {
    super.initState();
    _getAccounts();
  }

  _getAccounts() {
    _sharedPrefsAccount.getAccounts().then((value) {
      setState(() {
        _accounts = value ?? accountInitList;
      });
    });
  }

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
                  'Login',
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
                  icon: const Icon(Icons.person),
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
                  icon: const Icon(Icons.key),
                  hintText: passWordMess,
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
                    if (passwordController.text.isEmpty) {
                      passWordMess = 'please input password';
                    } else {
                      bool isCorrect = false;
                      for (int i = 0; i < _accounts.length; i++) {
                        if (usernameController.text == _accounts[i].username &&
                            passwordController.text == _accounts[i].password) {
                          isCorrect = true;
                          break;
                        }
                      }
                      if (isCorrect) {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Login success!!!!'),
                        );
                        passwordController.text = '';
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Route route = MaterialPageRoute(
                            builder: (context) => HomePage(
                                  username: usernameController.text,
                                ));
                        Navigator.pushReplacement(context, route);
                      } else {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Incorrect username or password'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print(_accounts.last.username);
                      }
                    }
                    setState(() {});
                  },
                  text: 'Login',
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
              onTap: () async {
                Account? account = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(accounts: _accounts),
                  ),
                );
                if (account != null) {

                  setState(() {
                    // Update the state with the new account
                    
                    _accounts.add(account);

                    _sharedPrefsAccount.addAccounts(_accounts);
                    _getAccounts();
                  });
                }
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
