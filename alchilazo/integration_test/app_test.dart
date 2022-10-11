import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:alchilazo/login_page.dart' as login;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login/Register page test', () {
    testWidgets('Se busca seleccionar la opcion de Inicio de Sesion',
        (tester) async {
      login.LoginPage();
      await tester.pumpAndSettle();

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Iniciar Sesión');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

    });
  });
}