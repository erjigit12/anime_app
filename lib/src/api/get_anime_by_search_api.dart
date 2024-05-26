import 'dart:convert';

import 'package:anime_app/src/config/app_config.dart';
import 'package:anime_app/src/models/anime.dart';
import 'package:anime_app/src/models/anime_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Anime>> getAnimeBySearchApi({
  required String query,
}) async {
  final baseUrl = "https://api.myanimelist.net/v2/anime?q=$query&limit=10";
  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLEINT-ID': clientId,
    },
  );

  if (response.statusCode == 200) {
    // Successful response
    final Map<String, dynamic> data = jsonDecode(response.body);
    AnimeInfo animeInfo = AnimeInfo.fromJson(data);
    Iterable<Anime> animes = animeInfo.animes;

    return animes;
  } else {
    // Error handling
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}