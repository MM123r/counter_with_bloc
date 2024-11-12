import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:counter_with_bloc/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(initCounterState()){
   on<addcounterevent>(addcounter);
   on<removecounterevent>(removecounter);
  }

  int counter = 0;
  addcounter(addcounterevent event,Emitter<CounterState>emit) {
    counter++;
    emit(UpdateCounterState());
  }

  removecounter(removecounterevent event,Emitter<CounterState>emit) {
    counter--;
    emit(UpdateCounterState());
  }
}
