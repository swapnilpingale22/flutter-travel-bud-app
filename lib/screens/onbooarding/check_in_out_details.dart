import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/screens/onbooarding/location.dart';

class CheckInOutDetailsScreen extends StatefulWidget {
  static const String routeName = '/check-in-out';
  const CheckInOutDetailsScreen({super.key});

  @override
  State<CheckInOutDetailsScreen> createState() =>
      _CheckInOutDetailsScreenState();
}

class _CheckInOutDetailsScreenState extends State<CheckInOutDetailsScreen> {
  Duration _checkInTime = const Duration(hours: 07, minutes: 08);
  Duration _checkOutTime = const Duration(hours: 07, minutes: 08);
  bool _isFlexibleCheckedIn = false;
  bool _isFlexibleCheckedOut = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check-in/out Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet consectetur.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Check-in Time'),
            SizedBox(
              height: 200,
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: _checkInTime,
                onTimerDurationChanged: (value) {
                  setState(() {
                    _checkInTime = value;
                  });
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isFlexibleCheckedIn,
                  onChanged: (newValue) {
                    setState(() {
                      _isFlexibleCheckedIn = newValue!;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                const Text('Flexible with Check-in time'),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Check-out Time'),
            SizedBox(
              height: 200,
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: _checkOutTime,
                onTimerDurationChanged: (value) {
                  setState(() {
                    _checkOutTime = value;
                  });
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isFlexibleCheckedOut,
                  onChanged: (newValue) {
                    setState(() {
                      _isFlexibleCheckedOut = newValue!;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                const Text('Flexible with Check-out time'),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      text: 'Next',
                      onTap: _checkInTime != _checkOutTime
                          ? () {
                              Navigator.pushNamed(
                                context,
                                LocationScreen.routeName,
                              );
                            }
                          : null,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
