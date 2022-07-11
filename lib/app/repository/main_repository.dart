import 'package:bringideas/app/data_source/local_data_source.dart';
import 'package:bringideas/app/data_source/rest_data.dart';
import 'package:bringideas/app/models/user.dart';

class MainRepository {
  final RestData _restDataSource;
  MainRepository(this._restDataSource);
  Map<String, dynamic>? result;

  Future<void> loadUserDB() async {
    await LocalDB.dropUser();
    await LocalDB.insertUser(User(
        userMail: 'gerardo.aguilar76@gmail.com',
        userPass: '123456',
        userName: 'Gerardo Aguilar'));
    await LocalDB.insertUser(User(
        userMail: 'admin@gmail.com',
        userPass: '124578',
        userName: 'Francisco Juarez'));
  }

  Future<User?> validaUserDB(String mail, pass) async {
    return LocalDB.validaUserDB(mail, pass);
  }

  Future<void> getClimate(String locality) async {
    return _restDataSource.getClimate(locality);
  }
}
