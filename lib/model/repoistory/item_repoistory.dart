import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/bloc/item_bloc.dart';
import 'package:flutter_application_1/model/repoistory/item.dart';

class ItemRepository {
  Future<List<Item>> getItems() async {
    final String response = await rootBundle.loadString('assets/items.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => Item.fromMap(item)).toList();
  }

  add(ItemLoadingState itemLoadingState) {}
}
