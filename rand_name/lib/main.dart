import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget{
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: ( BuildContext context ){
              final tiles = _saved.map(
                  (WordPair pair) {
                    return ListTile(
                      title: Text(
                        pair.asPascalCase,
                        style: _biggerFont,
                      ),
                    );
                  },
              );
              final divided = tiles.isNotEmpty ? ListTile.divideTiles(context: context, tiles: tiles).toList() : <Widget>[];

              return Scaffold(
                appBar: AppBar(
                  title: Text('Liked'),
                ),
                body: ListView(
                  children: divided,
                ),
              );
            },
        ),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Name gen'),
        actions: [
          IconButton(icon: Icon(Icons.favorite_outline), onPressed: _pushSaved),
      ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }
          else{
          _saved.add(pair);
          }
        });
      }
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(18),
      itemBuilder: (BuildContext _context, int i){
        if (i.isOdd){
          return Divider();
        }
        final int id = i~/2;
        if(id>=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[id]);
      },
    );
  }
}