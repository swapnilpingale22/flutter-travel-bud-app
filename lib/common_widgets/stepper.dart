import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class CustomStepper extends StatelessWidget {
  final int index;
  const CustomStepper({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ProgressStepper(
        width: MediaQuery.of(context).size.width * 0.9,
        currentStep: index,
        height: 4,
        stepCount: 8,
        progressColor: Colors.blue,
      ),
    );
  }
}
