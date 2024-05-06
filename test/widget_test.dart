import 'package:calculator_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Hello World Test", (WidgetTester tester) async {


    await tester.pumpWidget(const MyApp());

    expect(find.byType(Container), findsOneWidget);



    expect(find.text("Hello World"), findsOneWidget);

  });
}