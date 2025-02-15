import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petadoption/features/presentation/home/ui/home_screen.dart';

void main() {
  testWidgets('PetsHomeScreen displays title and categories', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PetsHomeScreen(),
      ),
    );

    // Check if the greeting text is displayed
    expect(find.text('Hi, Preeti 👋'), findsOneWidget);
    expect(find.text('Find your perfect pet!'), findsOneWidget);

    // Check if profile image is present
    expect(find.byType(CircleAvatar), findsWidgets);

    // Check if at least one category is displayed
    expect(find.text('Dogs'), findsOneWidget);
    expect(find.text('Cats'), findsOneWidget);
  });
}
