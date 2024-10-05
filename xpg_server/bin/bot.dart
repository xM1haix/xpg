import 'package:nyxx/nyxx.dart';
import 'package:xpg_server/server.dart';

void main() async {
  final client = await Nyxx.connectGateway(
    'MTE3MjU1NzE4MzUxNTM2MTMyMA.GKIGCZ.BHdj-Z65nRQUNfev6TUDj_x4fMQfPndydp6pM4',
    GatewayIntents.allUnprivileged | GatewayIntents.messageContent,
  );
  final User bot = await client.users.fetchCurrentUser();
  client.onMessageCreate.listen((event) async {
    if (event.guildId == null) return;
    if (event.guildId!.value != 657989440962297876) return;
    if (event.message.channelId.value != 1016675253826633818) return;
    if (event.message.author.id.value == bot.id.value) return;
    if (event.mentions.contains(bot)) {
      await event.message.channel.sendMessage(
        MessageBuilder(
          replyId: event.message.id,
          content: "Active",
        ),
      );
    }
    final options = event.message.content.split(' ').toList();
    switch (options[0]) {
      case '!db':
        String result;
        try {
          final conn = await db();
          result = 'connected';
        } catch (e) {
          result = e.toString();
        }
        await event.message.channel.sendMessage(
          MessageBuilder(
            replyId: event.message.id,
            content: result,
          ),
        );
        break;
    }
  });
}
