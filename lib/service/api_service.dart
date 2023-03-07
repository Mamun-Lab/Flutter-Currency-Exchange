import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_curency_app/constants/constants.dart';
import 'package:flutter_curency_app/model/currency_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  Future<List<CurrencyModel>> getLatest(String baseCurrrency) async {
    List<CurrencyModel> currencyModelList = [];
    String url =
        '${base_url}latest?apikey=$apikey&base_currency=$baseCurrrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];

        body.forEach((key, value) {
          CurrencyModel currencyModel = CurrencyModel.fromJson(value);
          currencyModelList.add(currencyModel);
        });
        return currencyModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<CurrencyModel>> getExchange(
     String baseCurrrency, String targetCurrency,String value) async {
    List<CurrencyModel> currencyModelList = [];

    String url =
        '${base_url}latest?apikey=$apikey&base_currency=$baseCurrrency&currencies=$targetCurrency&value=$value';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];

        body.forEach((key, value) {
          CurrencyModel currencyModel = CurrencyModel.fromJson(value);
          currencyModelList.add(currencyModel);
        });
        return currencyModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
