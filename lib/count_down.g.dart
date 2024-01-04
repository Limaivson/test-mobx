// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_down.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CountDown on _CountDown, Store {
  late final _$remainSecondsAtom =
      Atom(name: '_CountDown.remainSeconds', context: context);

  @override
  int get remainSeconds {
    _$remainSecondsAtom.reportRead();
    return super.remainSeconds;
  }

  @override
  set remainSeconds(int value) {
    _$remainSecondsAtom.reportWrite(value, super.remainSeconds, () {
      super.remainSeconds = value;
    });
  }

  late final _$_CountDownActionController =
      ActionController(name: '_CountDown', context: context);

  @override
  void decrement() {
    final _$actionInfo =
        _$_CountDownActionController.startAction(name: '_CountDown.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CountDownActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
remainSeconds: ${remainSeconds}
    ''';
  }
}
