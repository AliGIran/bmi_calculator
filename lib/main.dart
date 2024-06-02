import 'package:bmi/bmi_calculator/presentation/manager/bmi_cubit.dart';
import 'package:bmi/bmi_calculator/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => BmiCubit(),
    child: MaterialApp(theme: ThemeData.dark(), home: const HomePage()),
  ));
}

//
// class MyApp extends StatefulWidget {
//   MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("BMI Calculator"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             //Meter
//             const RadialGaugeExamplePage(),
//
//
//
//             //Gender
//
//             Container(
//                 margin: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: Row(
//                   children: <Widget>[
//                     const Text("Gender: "),
//                     Expanded(
//                       child: ListTile(
//                         title: const Text("male"),
//                         leading: Radio<String>(
//                           value: "male",
//                           groupValue: _selectedGender,
//                           onChanged: (String? value) {
//                             setState(() {
//                               _selectedGender = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListTile(
//                         title: const Text("female"),
//                         leading: Radio<String>(
//                           value: "female",
//                           groupValue: _selectedGender,
//                           onChanged: (String? value) => _selectedGender = value,
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//
//             //Height
//             Row(
//               children: [
//                 const Text("Height: "),
//                 Expanded(
//                     child: TextField(
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   controller: heightTextEditingController,
//                   decoration: const InputDecoration(),
//                   keyboardType: TextInputType.number,
//                 ))
//               ],
//             ),
//
//             //Weight
//
//             Container(
//               margin: const EdgeInsets.only(top: 10, bottom: 10),
//               child: Row(
//                 children: [
//                   const Text("Weight: "),
//                   Expanded(
//                       child: TextField(
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     controller: weightTextEditingController,
//                     decoration: const InputDecoration(),
//                     keyboardType: TextInputType.number,
//                   ))
//                 ],
//               ),
//             ),
//
//             //Calculate button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {}, child: const Text("Calculate")),
//
//                 //Clear button
//                 OutlinedButton(
//                     onPressed: () {
//                       ageTextEditingController.clear();
//                       weightTextEditingController.clear();
//                       heightTextEditingController.clear();
//                     },
//                     child: const Text("Clear")),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class RadialGaugeExamplePage extends StatefulWidget {
//   const RadialGaugeExamplePage({super.key});
//
//   @override
//   State<RadialGaugeExamplePage> createState() => _RadialGaugeExamplePageState();
// }
//
// class _RadialGaugeExamplePageState extends State<RadialGaugeExamplePage> {
//   @override
//
//   /// Build method of your widget.
//   @override
//   Widget build(BuildContext context) {
//     // Create animated radial gauge.
//     // All arguments changes will be automatically animated.
//     return AnimatedRadialGauge(
//
//         /// The animation duration.
//         duration: const Duration(seconds: 1),
//         curve: Curves.elasticOut,
//
//         /// Define the radius.
//         /// If you omit this value, the parent size will be used, if possible.
//         radius: 100,
//
//         /// Gauge value.
//         value: 50,
//
//         /// Optionally, you can configure your gauge, providing additional
//         /// styles and transformers.
//         axis: const GaugeAxis(
//
//             /// Provide the [min] and [max] value for the [value] argument.
//             min: 0,
//             max: 400,
//
//             /// Render the gauge as a 180-degree arc.
//             degrees: 270,
//
//             /// Set the background color and axis thickness.
//             style: GaugeAxisStyle(
//               thickness: 20,
//               background: Color(0xFFDFE2EC),
//               segmentSpacing: 4,
//             ),
//
//             /// Define the pointer that will indicate the progress (optional).
//             // pointer: GaugePointer.needle(
//             //   borderRadius: 16,
//             //   color: Colors.red,
//             //   width: 20,
//             //   height: 80,
//             // ),
//
//             pointer: GaugePointer.triangle(
//                 color: Colors.yellow, borderRadius: 16, width: 10, height: 20),
//
//             /// Define the progress bar (optional).
//             progressBar: GaugeProgressBar.rounded(
//               color: Color(0xFFB4C2F8),
//             ),
//
//             /// Define axis segments (optional).
//             segments: [
//               GaugeSegment(
//                 from: 0,
//                 to: 200,
//                 color: Color(0xFFD9DEEB),
//                 cornerRadius: Radius.zero,
//               ),
//               GaugeSegment(
//                 from: 200,
//                 to: 300,
//                 color: Color(0xFFD9DEEB),
//                 cornerRadius: Radius.zero,
//               ),
//               GaugeSegment(
//                 from: 300,
//                 to: 400,
//                 color: Color(0xFFD9DEEB),
//                 cornerRadius: Radius.zero,
//               ),
//             ]
//
//             /// You can also, define the child builder.
//             /// You will build a value label in the following way, but you can use the widget of your choice.
//             ///
//             /// For non-value related widgets, take a look at the [child] parameter.
//             /// ```
//             /// builder: (context, child, value) => RadialGaugeLabel(
//             ///  value: value,
//             ///  style: const TextStyle(
//             ///    color: Colors.black,
//             ///    fontSize: 46,
//             ///    fontWeight: FontWeight.bold,
//             ///  ),
//             /// ),
//             /// ```
//             ));
//   }
//
//   calculate() {
//     final double height = int.parse(heightTextEditingController.text) / 100;
//     final int weight = int.parse(weightTextEditingController.text);
//     final int bmiResult = (weight / pow(height, 2)) as int;
//
//     return bmiResult;
//
//
//   }
// }
