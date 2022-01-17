import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/api/client.dart';
import 'package:todo_list/model/user/loginRequest.dart';
import 'package:todo_list/model/user/registerRequest.dart';

part 'userStore.g.dart';

class UserStore extends UserStoreBase with _$UserStore {
  static UserStore? _instance;

  static UserStore get instance {
    if (_instance == null) {
      _instance = UserStore();
    }

    return _instance!;
  }
}

abstract class UserStoreBase with Store {
  final dio = Dio();

  @observable
  String id = '';

  @observable
  bool possibleRegister = false;

  @action
  register(RegisterRequest request) async {
    final data = await Client().register(request);
    if (data != "") {
      possibleRegister = true;
    }
    print(data);
  }

  @action
  login(LoginRequest request) async {
    final data = await Client().login(request);
    if (data == "") {
      return;
    }
    Client.token = data;
  }

  @action
  logOut() {
    Client.token = '';
  }
}
