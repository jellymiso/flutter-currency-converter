import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:live_exchange_rate_converter/secrets.dart';

String apiKey = exchangeRateAPIKey;

Future<CurrencyInfo> getCurrencyInfo({String? baseCurrency = "sgd"}) async {
  final response = await http.get(Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/latest/$baseCurrency'));
  
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    return CurrencyInfo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load currency info.');
  }
}

Future<double> getRates({String baseCurrency = "sgd", String targetCurrency = "usd", }) async {
  final response = await http.get(Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/pair/$baseCurrency/$targetCurrency'));
  
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;
    if(data["result"] == "success"){
      return data["conversion_rate"];
    }
    else{
      return -1;
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load currency info.');
  }
}


class CurrencyInfo {
  final String result;
  final String lastUpdateDateTime;
  final String nextUpdateDateTime;
  final String baseCurrency;
  final Map<String, dynamic> rates;

  const CurrencyInfo({
    required this.result, 
    required this.lastUpdateDateTime, 
    required this.nextUpdateDateTime, 
    required this.baseCurrency, 
    required this.rates
  });

  factory CurrencyInfo.fromJson(Map<String, dynamic> json) {
    return CurrencyInfo(
      result: json["result"] as String,
      lastUpdateDateTime: json["time_last_update_utc"] as String,
      nextUpdateDateTime: json["time_next_update_utc"] as String,
      baseCurrency: json["base_code"] as String,
      rates: json["conversion_rates"] as Map<String, dynamic>
    );
  }


}