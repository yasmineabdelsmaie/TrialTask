import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:trial_task/src/constants/constants.dart';

import '../models/item_model.dart';

class ItemListService {
  late Client client;
  late Databases database;
  ItemListService(){
    client = Client().setEndpoint(Constants.endPointBaseURL).setProject(Constants.projectId);
    database =  Databases(client);
  }

  Future<List<Item>> loadItems() async {
    try {
      final DocumentList response = await database.listDocuments(
          databaseId: Constants.dataBaseId,
          collectionId: Constants.collectionId,
      );
      List<Item> itemList = response.documents
          .map((document) => Item.fromJson(document.data))
          .toList();
      return itemList;
    } catch (ex) {
      return [];
    }
  }
}
