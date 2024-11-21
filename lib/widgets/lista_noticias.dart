import 'package:flutter/material.dart';
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:flutter_news_apps/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(noticia: noticias[index], index: index);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.description ?? ''),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    );
  }
}

class TarjetaNoticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const TarjetaNoticia({Key? key, required this.noticia, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.lightBlueAccent
          ], // Colores del degradado.
          begin: Alignment.topLeft, // Inicio del degradado.
          end: Alignment.bottomRight, // Fin del degradado.
        ),
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 255, 255, 255), // Color del borde.
          width: 2, // Grosor del borde.
        ),
        borderRadius: BorderRadius.circular(10), // Bordes redondeados.
      ),
      padding: const EdgeInsets.all(100),
      child: Column(
        children: [
          // Barra superior (índice y fuente de la noticia).
          _TarjetaTopBar(noticia, index),
          // Imagen de la noticia.
          _TarjetaImagen(noticia),
          // Título de la noticia.
          _TarjetaTitulo(noticia),
          // Espacio adicional si necesitas botones u otro contenido.
          const SizedBox(height: 30),
        ],
      ),
      // ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: (noticia.urlToImage != null)
          ? FadeInImage(
              placeholder: const AssetImage('assets/img/load.gif'),
              image: NetworkImage(noticia.urlToImage!),
              height: 130,
              width: 280,
              fit: BoxFit.cover,
            )
          : const Image(
              image: AssetImage('assets/img/not_image.png'),
              height: 130,
              width: 280,
              fit: BoxFit.cover,
            ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLines: 2, // Limita el texto a dos líneas.
        overflow: TextOverflow.ellipsis, // Muestra "..." si es muy largo.
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color:
            Color.fromARGB(255, 76, 82, 163), // Fondo claro para diferenciar.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${index + 1}.',
            // style: TextStyle(color: Theme.of(context).cardColor),
          ),
          Expanded(
            child: Text(noticia.source.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
