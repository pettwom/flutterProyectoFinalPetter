import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:flutter_news_apps/services/new_services.dart';
import 'package:flutter_news_apps/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab3Page extends StatefulWidget {
  const Tab3Page({super.key});

  @override
  State<Tab3Page> createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines_tech =
        Provider.of<NewsServicesTech>(context).headlines_tech;
    return Scaffold(
        body: (headlines_tech == 0)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(headlines_tech));
  }

  @override
  bool get wantKeepAlive => true;
}
