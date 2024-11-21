import 'package:flutter/material.dart';
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'd5b16523deb544368bd5238695b15c0b';
// const _APIKEY = 'b10391596932442a87086436bb857ebc';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];

  NewsServices() {
    getTopHeadlines();
  }

  get headlines_tech => null;

  Future<void> getTopHeadlines() async {
    final url = Uri.parse(
        '$_URL_NEWS/everything?q=tesla&from=2024-10-21&sortBy=publishedAt&apiKey=$_APIKEY');
    // Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlines.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }
}

class NewsServicesSports with ChangeNotifier {
  List<Article> headlines_sport = [];

  NewsServicesSports() {
    getTopHeadlines();
  }

  Future<void> getTopHeadlines() async {
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?country=us&category=sport&apiKey=$_APIKEY');
    // Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    debugPrint('sport ${url}');
    try {
      final resp = await http.get(url);
      debugPrint('prueba ${resp}');
      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlines_sport.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepcion al cargar las noticias sport $e');
    }
  }
}

class NewsServicesTech with ChangeNotifier {
  List<Article> headlines_tech = [];

  NewsServicesTech() {
    getTopHeadlines();
  }

  Future<void> getTopHeadlines() async {
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?country=us&category=science&apiKey=$_APIKEY');
    // Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlines_tech.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepcion al cargar las noticias tech $e');
    }
  }
}
