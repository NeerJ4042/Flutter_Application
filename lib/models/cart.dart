import 'package:flutter_app/models/catalog.dart';

class CartModel {

  final List<int> _itemIds = [];
  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog (CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items =>_itemIds.map((id) => _catalog.getById(id)).toList();


  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}