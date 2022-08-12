import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> getVouchers(String? token) async {
  String currentToken = "Bearer $token";

  final response = await http.post(
      Uri.parse('https://staging-deposit-pqu2.encr.app/deposit.GetAllVouchers'),
      headers: {"Authorization": currentToken});
  if (response.statusCode == 200) {
    Map<String, dynamic> content = jsonDecode(response.body);
    return content;
  } else {
    return {};
  }
}

Future<Map<String, dynamic>> depositClaim(
  String token,
  String publicKey,
  String code,
) async {
  String currentToken = "Bearer $token";

  final Map<String, String> header = {"Authorization": currentToken};

  final Map<String, dynamic> body = {
    "depositID": code,
    "userPubKey": publicKey
  };

  print(header);
  print(body);

  final response = await http.post(
      Uri.parse('https://staging-deposit-pqu2.encr.app/deposit.Claim'),
      headers: header,
      body: body);
  print(response.body);
  if (response.statusCode == 200) {
    Map<String, dynamic> content = jsonDecode(response.body);
    return content;
  } else {
    return {};
  }
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  return token;
}
