import 'package:flutter/material.dart';
import 'package:todo_list/api/client.dart';
import 'package:todo_list/model/user/loginRequest.dart';
import 'package:todo_list/page/registerPage.dart';
import 'package:todo_list/page/todoListPage.dart';
import 'package:todo_list/store/userStore.dart';
import 'package:todo_list/widget/defaultTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 페이지'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              DefaultTextField(
                controller: idController,
                hintText: '아이디',
                obscureText: false,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: DefaultTextField(
                  controller: pwController,
                  hintText: '비밀번호',
                  obscureText: true,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await UserStore.instance.login(
                    LoginRequest(
                      id: idController.text,
                      password: pwController.text,
                    ),
                  );
                  if (Client.token == '') {
                    idController.text = "";
                    pwController.text = "";
                  } else {
                    print(Client.token);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TodoListPage(),
                      ),
                    );
                  }
                },
                child: Text('로그인'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                child: Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
