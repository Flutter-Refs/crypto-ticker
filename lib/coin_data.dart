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
  Future getExchangeRateData(String crypto, String currency) async {
    var url = Uri.parse('$baseUrl/$crypto/$currency');

    try {
      var res = await http.get(url, headers: <String, String>{
        "X-CoinAPI-Key": apiKey,
      });

      return jsonDecode(res.body)['rate'];
    } catch (e) {
      print(e);
    }
  }
}
