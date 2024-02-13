import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';

Future<void> showConfirmDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: SvgPicture.asset('assets/images/questioMark.svg'),
        title: const Text('Save & Exit'),
        content: const Text(
          'Are you sure, you want to exit? All changes done till now would be saved as Draft.',
          style: TextStyle(
            color: Colors.black38,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          CustomButton(
            text: 'Yes',
            onTap: () {
              Navigator.of(context).pop();
              SystemNavigator.pop(animated: true);
            },
          ),
          const SizedBox(height: 5),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: double.infinity,
              child: Text(
                'No',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
