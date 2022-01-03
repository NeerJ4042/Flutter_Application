import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/items_widget.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    loadItemData();
  }

  Future<void> loadItemData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalog = await rootBundle.loadString("assets/files/catalog.json");
    var interpreted = jsonDecode(catalog);
    var products = interpreted["products"];
    CatalogModel.items = List.from(products)
        .map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Center(child: Text('Catalog App', style: TextStyle(color: Colors.black),)),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: CatalogModel.items.length,
          itemBuilder:  (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                child: GridTile(
                  header: Container(
                      child: Text(CatalogModel.items[index].name),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                      color: Colors.blueAccent
                  ),
                  ),
                  footer: Container(
                    child: Text(CatalogModel.items[index].name, style: TextStyle(color: Colors.white),),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                  ),
                  child: Image.network(CatalogModel.items[index].image),
                ),
              ),
            );
          }
      ),
      drawer: MyDrawer(),
    );
  }
}