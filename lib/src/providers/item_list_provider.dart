import 'package:flutter/cupertino.dart';
import 'package:trial_task/src/services/item_list_service.dart';

import '../models/item_model.dart';

class ItemListProvider with ChangeNotifier {
  ItemListProvider() {
    Future.microtask(() => loadItems());
  }

  final ItemListService service = ItemListService();
  final List<Item> itemList = [];
  bool itemsLoading = false;
  bool itemsLoadingFailed = false;

  Future loadItems() async {
    setLoadingIndicator(true);
    try {
      itemList.clear();
      List<Item> items = await service.loadItems();
      itemList.addAll(items);
    } catch (ex) {
      itemsLoadingFailed = true;
    } finally {
      setLoadingIndicator(false);
    }
  }

  void setLoadingIndicator(bool value) {
    itemsLoading = value;
    notifyListeners();
  }
}
