import 'package:bmi/bmi_calculator/presentation/manager/bmi_cubit.dart';
import 'package:bmi/bmi_calculator/presentation/manager/bmi_state.dart';
import 'package:bmi/bmi_calculator/presentation/variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ShowBmi extends StatelessWidget {
  const ShowBmi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Text('${BmiCalculated().bmiResult}'),
        );
  }
}

class UserAge extends StatelessWidget {
  const UserAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        controller: ageTextEditingController,
        decoration: const InputDecoration(labelText: "Age"),
      ),
    );
  }
}

class UserGender extends StatefulWidget {
  const UserGender({super.key});

  @override
  State<UserGender> createState() => _UserGenderState();
}

class _UserGenderState extends State<UserGender> {
  // Genders genderSelection = Genders.Male;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: SegmentedButton(
        segments: const <ButtonSegment<Genders>>[
          ButtonSegment<Genders>(value: Genders.male, icon: Icon(Icons.man)),
          ButtonSegment(value: Genders.female, icon: Icon(Icons.woman))
        ],
        selected: <Genders>{selectedGender},
        onSelectionChanged: (Set<Genders> newGenderSelection) {
          setState(() {
            selectedGender = newGenderSelection.first;
          });
        },
      ),
    );
  }
}

class UserHeight extends StatelessWidget {
  const UserHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        onChanged: (value) {
          context.read<BmiCubit>().setHeight(int.parse(value));
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        controller: heightTextEditingController,
        decoration: const InputDecoration(labelText: "Height (cm)"),
      ),
    );
  }
}

class UserWeight extends StatelessWidget {
  const UserWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        onChanged: (value) {
          context.read<BmiCubit>().setWeight(int.parse(value));
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        controller: weightTextEditingController,
        decoration: const InputDecoration(labelText: "Weight (kg)"),
      ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          context.read<BmiCubit>().bmiCalculate();
          FocusScope.of(context).unfocus();
        },
        child: const Text("Calculate"));
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          ageTextEditingController.clear();
          heightTextEditingController.clear();
          weightTextEditingController.clear();
          selectedGender = Genders.male;
        },
        child: const Text("Clear"));
  }
}

class RadialGaugeExamplePage extends StatefulWidget {
  const RadialGaugeExamplePage({super.key});

  @override
  State<RadialGaugeExamplePage> createState() => _RadialGaugeExamplePageState();
}

class _RadialGaugeExamplePageState extends State<RadialGaugeExamplePage> {
  @override

  /// Build method of your widget.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(

      builder: (context, state) {

        double bmiValue = 0.0;

        if (state is BmiCalculated) {
          bmiValue = state.bmiResult;
        }

        return Center(
            child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(
                    minimum: 15,
                    maximum: 40,
                    ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 15,
                      endValue: 18.5,
                      color: Colors.yellowAccent),
                  GaugeRange(
                      startValue: 18.5,
                      endValue: 25,
                      color: Colors.green),
                  GaugeRange(
                      startValue: 25,
                      endValue: 40,
                      color: Colors.red)
                ],
                    pointers: <GaugePointer>[
                        NeedlePointer(value: bmiValue)
                ],
                    annotations: <GaugeAnnotation>[

                      GaugeAnnotation(
                        widget: Text(
                          bmiValue.toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                        angle: 90,
                        positionFactor: 0.5)
          ])
        ]));
      },
    );
  }


}
