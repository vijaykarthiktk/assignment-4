import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_concepts_app/main.dart';
import 'package:flutter_concepts_app/screens/home_screen.dart';

void main() {
  setUp(() {
    // Set standard device size for tests
  });

  testWidgets('HomeScreen smoke test - displays title and concept modules', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const FlutterConceptsApp());
    await tester.pumpAndSettle();

    // Verify AppBar title
    expect(find.text('Flutter Core Concepts'), findsOneWidget);

    // Verify 3 Concept cards
    expect(find.text('User Input & Forms'), findsOneWidget);
    expect(find.text('Images, Assets & Fonts'), findsOneWidget);
    expect(find.text('Interactive Animations'), findsOneWidget);
  });

  testWidgets('Navigation to FormScreen and validation test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const FlutterConceptsApp());
    await tester.pumpAndSettle();

    // Tap on Form Concept Card
    await tester.tap(find.text('User Input & Forms'));
    await tester.pumpAndSettle();

    // Verify FormScreen title
    expect(find.text('User Input & Form Validation'), findsOneWidget);

    // Verify form fields exist
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Ensure Submit button is visible and tap
    await tester.ensureVisible(find.text('Submit Form'));
    await tester.tap(find.text('Submit Form'));
    await tester.pumpAndSettle();

    // Verify validation errors appear
    expect(find.text('Please enter your full name'), findsOneWidget);
    expect(find.text('Email address is required'), findsOneWidget);
    expect(find.text('Phone number is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);

    // Test Reset
    await tester.ensureVisible(find.text('Reset'));
    await tester.tap(find.text('Reset'));
    await tester.pumpAndSettle();

    // Go back to home
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Navigation to ImageGridScreen test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const FlutterConceptsApp());
    await tester.pumpAndSettle();

    // Tap on Image Gallery Card
    await tester.tap(find.text('Images, Assets & Fonts'));
    await tester.pumpAndSettle();

    // Verify ImageGridScreen title
    expect(find.text('Images, Assets & Fonts'), findsOneWidget);

    // Verify GridView is loaded
    expect(find.byType(GridView), findsOneWidget);

    // Go back
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Navigation to AnimationScreen and toggle test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const FlutterConceptsApp());
    await tester.pumpAndSettle();

    // Tap on Animation Concept Card
    await tester.ensureVisible(find.text('Interactive Animations'));
    await tester.tap(find.text('Interactive Animations'));
    await tester.pumpAndSettle();

    // Verify AnimationScreen title
    expect(find.text('Interactive AnimatedContainer'), findsOneWidget);

    // Verify AnimatedContainer exists
    expect(find.byKey(const Key('interactive_animated_container')), findsOneWidget);

    // Tap Primary Toggle Button
    await tester.ensureVisible(find.text('Switch to State B'));
    await tester.tap(find.text('Switch to State B'));
    await tester.pumpAndSettle();

    // State B should now be active
    expect(find.text('Switch to State A'), findsOneWidget);
  });
}
