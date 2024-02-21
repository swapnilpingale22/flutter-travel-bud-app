import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/screens/bottom_bar/bottom_bar.dart';
import 'package:travel_bud/services/auth_services.dart';

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

Future<void> showLocationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(
          Icons.location_on_outlined,
          color: Colors.blue,
          size: 40,
        ),
        title: const Text('Turn Location On'),
        content: const Text(
          'Your Location is off. Please turn on Location to allow TravelBud to see your location.',
          style: TextStyle(
            color: Colors.black38,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          CustomButton(
            text: 'Settings',
            onTap: () {
              Navigator.pop(context);
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
                'Cancel',
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

Future<void> showCongratulationsDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: SvgPicture.asset('assets/images/party.svg'),
        title: const Text('Congratulations'),
        content: const Text(
          'Congratulations , you are one step away from getting your property listed. \n\nReview process would be completed within 48 hours.',
          style: TextStyle(
            color: Colors.black38,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          CustomButton(
            text: 'Okay',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                BottomBar.routeName,
                (route) => false,
              );
            },
          ),
        ],
      );
    },
  );
}

Future<void> showLogOutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: SvgPicture.asset('assets/images/questioMark.svg'),
        title: const Text('Log Out'),
        content: const Text(
          'Do you really want to log out?',
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

              AuthService().logOut(context);
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
