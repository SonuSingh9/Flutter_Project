import 'package:first_app/core/store.dart';
import 'package:first_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog; // Declare private variable properly

  final List<int> _itemIds = []; // Keep item IDs

  // Getter to access _catalog
  CatalogModel get catalog => _catalog;

  // Setter to update _catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => 
    _itemIds.map((id) => _catalog.getById(id))
            .whereType<Item>()
            .toList();


  // Calculate total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add item by id
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item by id
  void remove(Item item) {
    _itemIds.remove(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  
  @override
  perform() {
    store?.cart.remove(item);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart.add(item);
  }
}