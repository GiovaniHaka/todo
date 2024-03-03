// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Classe que representa um componente que remove o foco de um campo de texto.
class OnzeUnfocuser extends StatefulWidget {
  final Widget? child;
  final double minScrollDistance;

  const OnzeUnfocuser({
    Key? key,
    this.child,
    this.minScrollDistance = 10.0,
  }) : super(key: key);

  @override
  _OnzeUnfocuserState createState() => _OnzeUnfocuserState();
}

class _OnzeUnfocuserState extends State<OnzeUnfocuser> {
  RenderBox? _lastRenderBox;
  Offset? _touchStartPosition;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) {
        _touchStartPosition = e.position;
      },
      onPointerUp: (e) {
        var touchStopPosition = e.position;
        if (widget.minScrollDistance > 0.0 && _touchStartPosition != null) {
          var difference = _touchStartPosition! - touchStopPosition;
          _touchStartPosition = null;
          if (difference.distance > widget.minScrollDistance) {
            return;
          }
        }

        var rb = context.findRenderObject() as RenderBox;
        var result = BoxHitTestResult();
        rb.hitTest(result, position: touchStopPosition);

        if (result.path.any(
            (entry) => entry.target.runtimeType == IgnoreUnfocuserRenderBox)) {
          return;
        }
        var isEditable = result.path.any((entry) =>
            entry.target.runtimeType == RenderEditable ||
            entry.target.runtimeType == RenderParagraph ||
            entry.target.runtimeType == ForceUnfocuserRenderBox);

        var currentFocus = FocusScope.of(context);
        if (!isEditable) {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            _lastRenderBox = null;
          }
        } else {
          for (var entry in result.path) {
            var isEditable = entry.target.runtimeType == RenderEditable ||
                entry.target.runtimeType == RenderParagraph ||
                entry.target.runtimeType == ForceUnfocuserRenderBox;

            if (isEditable) {
              var renderBox = (entry.target as RenderBox);
              if (_lastRenderBox != renderBox) {
                _lastRenderBox = renderBox;
                setState(() {});
              }
            }
          }
        }
      },
      child: widget.child,
    );
  }
}

class IgnoreUnfocuser extends SingleChildRenderObjectWidget {
  const IgnoreUnfocuser({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  IgnoreUnfocuserRenderBox createRenderObject(BuildContext context) {
    return IgnoreUnfocuserRenderBox();
  }
}

class ForceUnfocuser extends SingleChildRenderObjectWidget {
  const ForceUnfocuser({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  ForceUnfocuserRenderBox createRenderObject(BuildContext context) {
    return ForceUnfocuserRenderBox();
  }
}

class IgnoreUnfocuserRenderBox extends RenderPointerListener {}

class ForceUnfocuserRenderBox extends RenderPointerListener {}
