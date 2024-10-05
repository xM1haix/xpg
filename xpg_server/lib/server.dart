import 'package:postgres/postgres.dart';

Future<Connection> db() async => await Connection.open(
      Endpoint(
        host: 'localhost',
        database: 'mods',
        username: 'dart',
        password: 'ILikeToPlayHaloMCC',
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );
