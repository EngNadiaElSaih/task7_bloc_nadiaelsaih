import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/counter/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment() => emit(CounterState(state.counter + 1));
  void decrement() => emit(CounterState(state.counter - 1));
  void reset() => emit(CounterState(0));
}
