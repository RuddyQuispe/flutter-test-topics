import 'package:flutter_test_topics/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'users.db'), onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, name varchar(255) not null, email varchar(255) not null, phone varchar(255) not null, address varchar(255) not null, password varchar(255) not null);");
    }, version: 1);
  }

  static Future<void> create(User user) async {
    Database database = await _openDB();
    database.insert("user", user.toMap());
  }

  static Future<List<User>> users() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> usersMap = await database.query("user");
    return List.generate(
        usersMap.length,
        (index) => User(
            id: usersMap[index]['id'],
            name: usersMap[index]['name'],
            email: usersMap[index]['email'],
            phone: usersMap[index]['phone'],
            address: usersMap[index]['address'],
            password: usersMap[index]['password']));
  }

  static Future<List<User>> userByID(String email) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> usersMap = await database.query("user", where: "email='$email'");
    return List.generate(
        usersMap.length,
        (index) => User(
            id: usersMap[index]['id'],
            name: usersMap[index]['name'],
            email: usersMap[index]['email'],
            phone: usersMap[index]['phone'],
            address: usersMap[index]['address'],
            password: usersMap[index]['password']));
  }
}
