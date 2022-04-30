import 'package:flutter/services.dart';

// ignore: public_member_api_docs
Future<String> fetchTextFile(String assetPath) async {
  // try {
  return rootBundle
      .loadString(assetPath)
      .onError((error, stackTrace) => 'Please try again.');
  // } catch (e) {
  //   return e.toString();
  // }
}
