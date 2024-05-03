
import 'dart:convert';
import 'package:app/src/modules/home/model/address.dart';
import 'package:app/src/http/http_client.dart';

class ApiRepository {
  final HttpClient _httpClient = HttpClient();
  static const String baseUrl = 'https://viacep.com.br/ws/';

  Future<Address> getAddress(String cep) async {
    final response = await _httpClient.getDio().get('$baseUrl$cep/json');

    if (response.statusCode == 200) {
      final jsonData = jsonEncode(response.data);
      return Address.fromJson(jsonDecode(jsonData));
    } else {
      throw Exception('Failed to load address');
    }
  }
}