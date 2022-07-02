import 'package:flutter_bloc/flutter_bloc.dart';

class SafeCubit<State> extends Cubit<State>{
  SafeCubit(super.initialState);
  
  @override
  void emit(State state) {
    if(!isClosed){
      super.emit(state);
    }
  }
}
