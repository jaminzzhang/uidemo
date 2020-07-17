import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uidemo/load/load_page.dart';
import 'package:uidemo/load/load_page_bloc.dart';

import '../data/demo_data.dart';

enum HomePageRow { LoadRow, ImageRow, RowMax }

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title),
        ),
        body: Container(
        child: ListView.separated(
            itemCount: HomePageRow.RowMax.index,
            itemBuilder: (context, index) =>
                buildRow(context, HomePageRow.values[index]),
          separatorBuilder: (context, index) => Divider())));
  }

  Widget buildRow(BuildContext context, HomePageRow row) {
    String title;
    switch (row) {
      case HomePageRow.LoadRow:
        title = 'Loading';
        break;
      case HomePageRow.ImageRow:
        title = 'Image';
        break;
      default:
        title = 'null';
    }
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text(title),
            onTap: () {
              if (row == HomePageRow.LoadRow) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return BlocProvider(
                        create: (context) => LoadPageBloc(),
                        child: LoadPage(),
                      );
                    }));
              }
        }));
  }
}
