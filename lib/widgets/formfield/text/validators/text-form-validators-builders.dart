import 'package:flutter/material.dart';
import 'package:flutter_go_club_app/widgets/builder/builder.dart';

abstract class TextFormFieldValidatorBuilder implements ComponentBuilder<FormFieldValidator<String>> {}

typedef ValidationFunction = bool Function(String value);

class NotEmptyTextFormFieldValidatorBuilder implements TextFormFieldValidatorBuilder {
  final String _emptyMessage;

  NotEmptyTextFormFieldValidatorBuilder(this._emptyMessage);

  @override
  FormFieldValidator<String> build(BuildContext context) {
    return (value) {
      if (value.trim().isEmpty) {
        return _emptyMessage;
      }
      return null; // This null is required by the interface.
    };
  }
}

class PatternNotEmptyTextFormFieldValidatorBuilder implements TextFormFieldValidatorBuilder {
  final RegExp pattern;
  final String _patternMessage;
  final String _emptyMessage;

  PatternNotEmptyTextFormFieldValidatorBuilder(
      {@required RegExp regExp, @required String patternMessage, @required String emptyMessage})
      : this.pattern = regExp,
        this._patternMessage = patternMessage,
        this._emptyMessage = emptyMessage;

  @override
  FormFieldValidator<String> build(BuildContext context) {
    return (value) {
      if (value.isEmpty) {
        return _emptyMessage;
      } else if (!pattern.hasMatch(value)) {
        return _patternMessage;
      }
      return null; // This null is required by the interface.
    };
  }
}

class NotEmptyFunctionTextFormValidatorBuilder implements TextFormFieldValidatorBuilder {
  final ValidationFunction _validationFunction;
  final String _message;
  final String _emptyMessage;

  NotEmptyFunctionTextFormValidatorBuilder(
      {@required ValidationFunction validationFunction, @required String message, @required String emptyMessage})
      : this._validationFunction = validationFunction,
        this._emptyMessage = emptyMessage,
        this._message = message;

  @override
  FormFieldValidator<String> build(BuildContext context) {
    return (value) {
      if (value.isEmpty) {
        return _emptyMessage;
      } else if (!_validationFunction(value)) {
        return _message;
      }
      return null; // This null is required by the interface.
    };
  }
}