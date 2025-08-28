// ignore_for_file: unused_element

import 'dart:async';
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart';

typedef AppBuilder = FutureOr<Widget> Function();

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError ${bloc.runtimeType}', error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

@pragma('vm:entry-point')
Future<void> bootstrap(AppBuilder builder) async {
  FlutterError.onError = (details) {
    logE(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SizeConfig.init();
      final storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
                (await getApplicationDocumentsDirectory()).path,
              ),
      );

      HydratedBloc.storage = storage;

      SystemUiOverlayTheme.setPortraitOrientation();

      runApp(
        await builder(),
      );
    },
    (error, stack) {
      logE(error.toString(), stackTrace: stack);
    },
  );
}
