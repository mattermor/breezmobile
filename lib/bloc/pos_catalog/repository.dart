import 'package:breez/bloc/pos_catalog/model.dart';

abstract class Repository {
  //Assets
  Future<String> addAsset(List<int> imageData);
  Future<void> deleteAsset(String url);
  Future<List<int>> fetchAssetByURL(String url);

  // Item
  Future<int> addItem(Item item);
  Future<void> deleteItem(int id);
  Future<void> updateItem(Item item);
  Future<Item> fetchItemByID(int id);
  //This should be converted later to support pagination.
  Future<List<Item>> fetchAllItems();

  // Sale
  Future<int> addSale(Sale sale);
  Future<Sale> fetchSaleByID(int id);
}
