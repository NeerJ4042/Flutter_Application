import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final Item catalog;
  const ItemDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
            children: [
              Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image),
              ).h(250),

              Expanded(
                  child: VxArc(
                    height: 30,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      width: context.screenWidth,
                      color: MyTheme.creamColor,
                      child: Column(
                        children: [
                          60.heightBox,
                          catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                          catalog.desc.text.xl2.make(),
                          7.heightBox,
                        ],
                      )
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
  }
}
