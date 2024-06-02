// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
abstract class BmiState {
  final int height;
  final int weight;

  const BmiState(this.height, this.weight);
}

class BmiInitial extends BmiState {
  const BmiInitial(int height, int weight) : super(height, weight);
}

class BmiCalculated extends BmiState {
  final double bmiResult;

  const BmiCalculated(int height, int weight, this.bmiResult)
      : super(height, weight);



}
