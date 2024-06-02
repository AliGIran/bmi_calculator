import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'bmi_state.dart';



class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiInitial(0, 0));

  void setHeight(int height) {
    emit(BmiInitial(height, state.weight));
  }

  void setWeight(int weight) {
    emit(BmiInitial(state.height, weight));
  }

  void bmiCalculate() {
    final int height = state.height;
    final int weight = state.weight;
    if (height == 0 || weight == 0) {
      // emit(BmiInitial(height, weight)); // Re-emit initial state if inputs are invalid
      return;
    }

    final double heightInMeters = height / 100.0;
    final double bmi = weight / pow(heightInMeters, 2);

    emit(BmiCalculated(height, weight, bmi));
  }
}
