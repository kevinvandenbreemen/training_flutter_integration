import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_flutter_integration/helloservice.dart';
import 'package:training_flutter_integration/main.dart';
import 'package:mockito/mockito.dart';
import 'dart:async';

class MockHelloService extends Mock implements HelloService{
}


void main() {
  testWidgets('Prints Hello Message', (WidgetTester tester) async {

    HelloService service = new MockHelloService();
    when(service.getMessage()).thenReturn(Future.value("Hello From Integration Test"));

    // Trigger single render of the app (single frame)
    await tester.pumpWidget(new MaterialApp(home: new MyApp(service)));

    // Verify the 'say hi' button is on the screen
    expect(find.text("Say Hi"), findsOneWidget);

    // Tap it and trigger a frame.
    await tester.tap(find.text("Say Hi"));
    await tester.pump();

    // Finally verify that the greeting message is displayed on the screen!
    expect(find.text('Hello From Integration Test'), findsOneWidget);
  });
}
