import 'package:machine_test/api_integration_using_bloc/counter/counter_state.dart';
import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvents,CounterState>{
  CounterBloc(): super(InitialState()){
  on<Increment>((event, emit) {

    return emit(CounterState(count: state.count+1));
  });

  on<Decrement>((event, emit) {
  return emit(CounterState(count: state.count-1));
  });
  }
}