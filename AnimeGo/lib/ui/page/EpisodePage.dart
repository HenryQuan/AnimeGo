import 'package:AnimeGo/core/Global.dart';
import 'package:AnimeGo/core/model/AnimeInfo.dart';
import 'package:AnimeGo/core/model/OneEpisodeInfo.dart';
import 'package:AnimeGo/core/parser/OneEpisodeParser.dart';
import 'package:AnimeGo/ui/page/AnimeDetailPage.dart';
import 'package:AnimeGo/ui/page/CategoryPage.dart';
import 'package:flutter/material.dart';

/// EpisodePage class
class EpisodePage extends StatefulWidget {
  final AnimeInfo info;
  EpisodePage({Key key, @required this.info}) : super(key: key);

  @override
  _EpisodePageState createState() => _EpisodePageState();
}


class _EpisodePageState extends State<EpisodePage> {
  OneEpisodeInfo info;
  final global = Global();
  
  @override
  void initState() {
    super.initState();
    final parser = OneEpisodeParser(global.getDomain() + widget.info.link);
    parser.downloadHTML().then((body) {
      setState(() {
        this.info = parser.parseHTML(body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.info.getTitle())
      ),
      body: info == null ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      ListView(
        children: <Widget>[
          ListTile(
            title: Text('Category'),
            subtitle: Text(info.category),
            onTap: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => CategoryPage(
                  url: info.categoryLink, 
                  title: info.category)
                ),
              );
            },
          ),
          ListTile(
            title: Text('Anime Info'),
            subtitle: Text(info.name),
            onTap: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => AnimeDetailPage()),
              );
            },
          ),
          ListTile(
            title: Text('Server List'),
            subtitle: Wrap(
              children: renderServerList(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderServerList() {
    return this.info.servers.map((e) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ActionChip(
          onPressed: () {

          }, 
          label: Text(e.title),
        ),
      );
    }).toList();
  }
}
