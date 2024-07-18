import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CustomDio()),
      ],
      child: child,
    );
  }
}
