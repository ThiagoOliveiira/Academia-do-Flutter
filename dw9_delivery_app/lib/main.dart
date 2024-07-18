import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const Dw9DeliveryApp());
}
