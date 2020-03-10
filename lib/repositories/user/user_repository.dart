import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:isafe/api/api.dart';
import 'package:isafe/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static const String TOKEN_KEY = 'TOKEN_KEY';

  Future<User> signIn({
    @required String username,
    @required String password
  }) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password
    };

    final response = await ApiClient().postClient('signIn', data);
    
    if(response.statusCode == 200){
      return User.fromJson(response.data);
    } else {
      throw Exception('Failed to sign in');
    }
  }

  Future<int> changePassword({
    @required String newpassword
  }) async {
    Map<String, dynamic> data = {
      'newpassword': newpassword
    };

    final response = await ApiClient().postClient('change-password', data);
    
    if(response.statusCode == 200){
      return response.statusCode;
    } else {
      throw Exception('Unauthorized');
    }
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(TOKEN_KEY);
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(TOKEN_KEY, token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    try {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString(TOKEN_KEY);
      
      if (token != null) {
        return true;
      }
    } catch (_) {
      return false;
    }

    return false;
  }

  Future<bool> authenticateForgotPassword({
    @required String username,
    @required String dateOfBirth,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
    // return false;
  }

  Future<bool> authenticateDefaultPassword({
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
    // return false;
  }

  Future<bool> authenticateChangePassword({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
    // return false;
  }
}