import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/testing.dart';

class RequestHandeling {
  http.Client client = http.Client();
//  http.Client Mclient = MockClient();
  final String BaseURL = 'localhost:8080';
  Future<bool> deactivateaccount(String token) async {
    http.Request request =
        http.Request('PUT', Uri.parse('$BaseURL/settings/deactivateAccount'));
    request.headers.addAll({"x-acess-token": token});
    http.Response response =
        await http.Response.fromStream(await client.send(request));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
