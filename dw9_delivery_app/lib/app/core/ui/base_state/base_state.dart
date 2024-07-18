import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase> extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();

    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}
}
