module Private::MessagesHelper

  require 'shared/messages_helper'
  include Shared::MessagesHelper

  def private_message_date_check(message, previous_message)
    if defined?(previous_message) && previous_message.present?
      # if messages are not created at the same day
      if previous_message.created_at.to_date != message.created_at.to_date
        @message = message
        'private/messages/message/new_date'
      else
        'posts/shared/empty_partial'
      end
    else
      'posts/shared/empty_partial'
    end
  end

  def sent_or_received(message, user)
    user.id == message.user_id ? 'message-sent' : 'message-received'
  end

  def seen_or_unseen(message)
    message.seen == false ? 'unseen' : ''
  end
end
