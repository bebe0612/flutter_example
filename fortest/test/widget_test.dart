// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:simple_todo/view/login_button.dart';
import 'package:simple_todo/view/login_cubit.dart';
import 'package:simple_todo/view/login_view.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final cubit = MockLoginCubit();

    when(() => cubit.login()).thenReturn(null);
    whenListen(cubit, Stream.fromIterable([LoginInitial()]),
        initialState: LoginInitial());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>.value(
            value: cubit, child: const LoginView()),
      ),
    );

    expect(find.byType(LoginButton), findsOneWidget);
    await tester.tap(find.byType(LoginButton));

    await tester.pump();

    verify(() => cubit.login()).called(1);
  });
}
