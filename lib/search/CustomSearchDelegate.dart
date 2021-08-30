import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // print("Resultado: pesquisa " + query);
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // print("resultado: digitando " + query);

    List<String> lista = List();

    if (query.isNotEmpty) {
      lista = ["Android", "Android Navegação", "IOS", "Jogos"]
          .where((text) => text.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
        itemCount: lista.length,
      );
    } else {
      return Center(
        child: Text("Nenhum Resultado para pesquisa"),
      );
    }
  }
}
