import 'package:db_test_project_thi/src/widgets/news_list_tile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    // THIS IS BAD!!!!! DONT DO THIS
    // TEMPORARY!
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
        stream: bloc.topIds,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return NewsListTile(itemId: snapshot.data[index]);
              });
        });
  }

  /*
  Test Implementation

  Widget buildList() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, int index) {
          return FutureBuilder(
              future: getFuture(),
              builder: (context, snapshot) {
                return Container(
                  height: 80.0,
                  child: snapshot.hasData
                      ? Text('Im visible $index')
                      : Text('I havent fetch data yet $index'),
                );
              });
        });
  }

  getFuture() {
    return Future.delayed(Duration(seconds: 2), () => 'hi');
  }
  */
}
