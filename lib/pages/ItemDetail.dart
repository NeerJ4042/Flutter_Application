import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final Item catalog;
  const ItemDetails({Key? key, required this.catalog}) : super(key: key);
  final String data = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
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
                          catalog.desc.text.xl.make(),
                          7.heightBox,

                          data.text.make().p16()
                        ],
                      )
                    ),
                  ),
                ),
            ],
          ),
        ),
      bottomNavigationBar: Container(
        color: MyTheme.creamColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.make(),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            StadiumBorder()
                        ),
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor)
                    ),
                    child: "Add to cart".text.make()
                ),
            ),
          ],
        ).p20(),
      ),
      );
  }
}
