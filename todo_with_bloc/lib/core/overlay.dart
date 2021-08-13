import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry? _overlaySupportEntry;
showLoadingOverlay() {
  _overlaySupportEntry = showOverlay(
    (context, progress) {
      return Material(
        color: Colors.black.withOpacity(.2),
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    },
    animationDuration: Duration(milliseconds: 0),
    duration: Duration(milliseconds: 30000),
  );
}

hideLoadingOverlay() {
  if (_overlaySupportEntry != null)
    _overlaySupportEntry!.dismiss(animate: false);
}
