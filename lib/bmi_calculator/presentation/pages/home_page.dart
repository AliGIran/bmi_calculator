import 'package:bmi/bmi_calculator/presentation/manager/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../manager/bmi_state.dart';
import '../widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<BmiCubit, BmiState>(
              builder: (context, state) {
                if (state is BmiCalculated) {
                  // return Text("BMI: ${state.bmiResult.toStringAsFixed(2)}");

                  return const RadialGaugeExamplePage();
                } else {
                  return const Text("No BMI yet.");
                  // return Placeholder(
                  //   fallbackHeight: MediaQuery.of(context).size.height * .2,
                  // );
                }
              },
            ),
            const Row(
              children: [
                Expanded(child: UserAge()),
                Expanded(child: UserGender())
              ],
            ),
            const Row(
              children: [
                Expanded(child: UserHeight()),
                Expanded(child: UserWeight())
              ],
            ),
            const Gap(40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearButton(),
                CalculateButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
