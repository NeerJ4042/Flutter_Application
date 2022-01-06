import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/pages/ItemDetail.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/items_widget.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
       child: Container(
         padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if(CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
               Center(child: CircularProgressIndicator()).expand()
            ],
          ),
       ),
      )
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
        final itemData = CatalogModel.items[index];
          return InkWell(
            onTap: () => {Navigator.push(context, MaterialPageRoute(
              builder: (context) => ItemDetails(
                    catalog: itemData
              )
            ))},
              child: CatalogItem(itemData: itemData)
          );
        },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item itemData;

  const CatalogItem({required this.itemData})
      : assert(itemData != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
              Hero(
                tag: Key(itemData.id.toString()),
                  child: CatalogImage(imageLink: itemData.image)
              ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  itemData.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                  Text(itemData.desc, style: TextStyle(fontSize: 12),),
                  7.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                        "\$${itemData.price}".text.bold.xl.make(),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                StadiumBorder()
                              ),
                              backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor)
                            ),
                            child: "Buy".text.make()
                        ),
                    ],
                  ).pOnly(right: 10)
                ],
              )
          ),
        ],
      ),

    ).rounded.square(120).white.make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String imageLink;
  const CatalogImage({Key? key, required this.imageLink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Image.network(imageLink)
          .box.make().p12(),
      alignment: Alignment.topLeft,
    );
  }
}


