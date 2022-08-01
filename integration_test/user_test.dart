
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nailroom/screen/login.dart';
import 'package:nailroom/screen/product.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('should have a title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/dashboard':(context) => const ProductScreen(),
        },
        home: const LoginScreen(),
      ),
    );
    // Finder title = find.text('Arthemetics');
    // expect(title, findsOneWidget);
    Finder email = find.byKey(const ValueKey('email'));
    await tester.enterText(email, 'tenzin@gmail.com');
    Finder password = find.byKey(const ValueKey('password'));
    await tester.enterText(password, 'tenzin');
    Finder loginbutton =  find.byKey(const ValueKey('Loginbutton'));
    await tester.tap(loginbutton);
    await tester.pump();
    expect(find.byType(Scaffold), findsOneWidget);
  });
}