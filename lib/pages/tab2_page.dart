import 'package:flutter/material.dart';
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:flutter_news_apps/services/new_services.dart';
import 'package:flutter_news_apps/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({super.key});

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines_sport =
        Provider.of<NewsServicesSports>(context).headlines_sport;

    return Scaffold(
        body: (headlines_sport == 0)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(headlines_sport));
  }

  @override
  bool get wantKeepAlive => true;
}
