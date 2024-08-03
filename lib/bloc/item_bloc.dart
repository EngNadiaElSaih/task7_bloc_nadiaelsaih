// import 'package:flutter_application_1/cubit/item_cubit.dart';
// import 'package:flutter_application_1/model/repoistory/item.dart';
// import 'package:flutter_application_1/model/repoistory/item_repoistory.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// part 'item_event.dart';
// part 'item_state.dart';

// class ItemBloc extends Bloc<ItemEvent, ItemState> {
//   final ItemRepoistory _itemRepoistory;

//   ItemBloc(this._itemRepoistory) : super(ItemLoadingState()) {
//     on<LoadItemEvent>(_onLoadItemEvent);
//   }

//   void _onLoadItemEvent(LoadItemEvent event, Emitter<ItemState> emit) {
//     emit(ItemLoadingState());
//     _itemRepoistory.getItems().then((items) {
//       emit(ItemLoadedState(items));
//     }).catchError((error) {
//       emit(ItemErrorState(error.toString()));
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/model/repoistory/item.dart';
import 'package:flutter_application_1/model/repoistory/item_repoistory.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _itemRepository;

  ItemBloc(this._itemRepository) : super(ItemLoadingState()) {
    on<LoadItemEvent>(_onLoadItemEvent);
  }

  void _onLoadItemEvent(LoadItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoadingState());
    try {
      final items = await _itemRepository.getItems();
      emit(ItemLoadedState(items));
    } catch (e) {
      emit(ItemErrorState(e.toString()));
    }
  }
}
