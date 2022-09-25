import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/image_extension.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;

  const BaseView({
    Key? key,
    required this.onPageBuilder,
    required this.viewModel,
    required this.onModelReady,
  }) : super(key: key);
  @override
  createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('gradient'.toBack), fit: BoxFit.fitHeight)),
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: widget.onPageBuilder(context, model))));
  }
}
