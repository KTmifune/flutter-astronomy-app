import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:space_iamge_app/data/model/astronomy_data.dart';
import 'package:http/http.dart' as http;

const String apiKey = '2S7v3LjCId8dd8zVcUFxJ8X9V8SAwrT5bBAckzJJ';
const String authority = 'api.nasa.gov';

class Repository {
  Future<AstronomyData> fetchAstronomy() async {
    const path = 'planetary' '/apod';
    try {
      final result =
          await http.get(Uri.https(authority, path, {'api_key': apiKey}));
      if (result.statusCode != 200) {
        throw "取得に失敗しました。statusCode：${result.statusCode}${result.reasonPhrase}";
      }
      final body =
          const Utf8Decoder(allowMalformed: true).convert(result.bodyBytes);
      return AstronomyData.fromJson(jsonDecode(body));
    } catch (error) {
      throw "実行エラー：$error";
    }
  }
}
