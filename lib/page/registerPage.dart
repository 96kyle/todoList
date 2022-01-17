import 'package:flutter/material.dart';
import 'package:todo_list/model/user/registerRequest.dart';
import 'package:todo_list/page/loginPage.dart';
import 'package:todo_list/store/userStore.dart';
import 'package:todo_list/widget/defaultTextField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
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
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: DefaultTextField(
                  controller: nameController,
                  hintText: '이름',
                  obscureText: false,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: TextButton(
                  onPressed: () async {
                    await UserStore.instance.register(
                      RegisterRequest(
                        id: idController.text,
                        password: pwController.text,
                        name: nameController.text,
                      ),
                    );
                    if (UserStore.instance.possibleRegister == false) {
                      idController.text = "";
                      pwController.text = "";
                      nameController.text = "";
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                      UserStore.instance.possibleRegister = false;
                    }
                  },
                  child: Text('회원가입'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
