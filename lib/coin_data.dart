// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BGN',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = "80AC0639-203A-4CA6-873D-E59F075E2C7B";

class CoinData {
  Future<Map<String, String>> getExchangeRateData(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (var crypto in cryptoList) {
      var url = Uri.parse('$baseUrl/$crypto/$currency');

      var res = await http.get(url, headers: <String, String>{
        "X-CoinAPI-Key": apiKey,
      });

      if (res.statusCode == 200) {
        cryptoPrices[crypto] = jsonDecode(res.body)['rate'].toStringAsFixed(0);
      } else {
        print(res.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
