import telegramYoutubeNotifer from 'telegram-youtube-notifier'

const telegramToken = process.env.TELEGRAM_TOKEN!
const telegramChatIds = process.env.TELEGRAM_CHAT_IDS!
const youtubeChannelId = process.env.YOUTUBE_CHANNEL_ID!
const message = process.env.MESSAGE_PREFIX!

telegramYoutubeNotifer({
  telegramToken,
  telegramChatIds,
  youtubeChannelId,
  message,
})
