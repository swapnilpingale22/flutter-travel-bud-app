import 'package:flutter/material.dart';
import 'package:travel_bud/screens/onbooarding/address.dart';
import 'package:travel_bud/screens/onbooarding/accommodation_details.dart';
import 'package:travel_bud/screens/onbooarding/add_amenities.dart';
import 'package:travel_bud/screens/onbooarding/amenities.dart';
import 'package:travel_bud/screens/onbooarding/check_in_out_details.dart';
import 'package:travel_bud/screens/onbooarding/homestay_description.dart';
import 'package:travel_bud/screens/onbooarding/homestay_title_screen.dart';
import 'package:travel_bud/screens/onbooarding/homestay_type.dart';
import 'package:travel_bud/screens/login/homescreen.dart';
import 'package:travel_bud/screens/onbooarding/location.dart';
import 'package:travel_bud/screens/onbooarding/photos.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );

    case HomeStayTitle.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeStayTitle(),
      );

    case HomestayTypeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomestayTypeScreen(),
      );

    case AccommodationDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AccommodationDetailsScreen(),
      );

    case AmenitiesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AmenitiesScreen(),
      );

    case AddAmenitiesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddAmenitiesScreen(),
      );

    case CheckInOutDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CheckInOutDetailsScreen(),
      );

    case LocationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LocationScreen(),
      );

    case AddresssScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddresssScreen(),
      );

    case PhotosScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PhotosScreen(),
      );

    case HomestayDescriptionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomestayDescriptionScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("404 Page not found!"),
          ),
        ),
      );
  }
}
