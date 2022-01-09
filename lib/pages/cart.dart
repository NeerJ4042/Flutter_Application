import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  //const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.black.xl2.make(),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CardList(),
          Divider(),
          _Total()
        ],
      ),

    );
  }
}

class _Total extends StatelessWidget {
  const _Total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 89,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl3.color(MyTheme.darkBluishColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: () {},
              child: "Buy".text.white.make(),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor)),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CardList extends StatefulWidget {
  const _CardList({Key? key}) : super(key: key);

  @override
  __CardListState createState() => __CardListState();
}

class __CardListState extends State<_CardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            title: "item".text.make(),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
          )
      ),
    ).expand();
  }
}

