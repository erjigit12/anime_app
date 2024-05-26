import 'dart:convert';

import 'package:anime_app/src/common/utils/utils.dart';
import 'package:anime_app/src/config/app_config.dart';
import 'package:anime_app/src/models/anime.dart';
import 'package:anime_app/src/models/anime_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Anime>> getSeasonalAnimesApi({
  required int limit,
}) async {
  final year = DateTime.now().year;
  final season = getCurrentSeason();
  final baseUrl =
      "https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit";

  // Make a Get request
  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': clientId,
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final seasonalAnime = AnimeInfo.fromJson(data);

    return seasonalAnime.animes;
  } else {
    // Error handling
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}
