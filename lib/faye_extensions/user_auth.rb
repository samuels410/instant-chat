class UserAuth
  def incoming(message, callback)
    if message['channel'] == "/meta/user_connect"
      user_id = message['data']['data']['session_id']
      user = User.find(user_id)
      puts "found user:#{user.id}"
      if user
        Api::FayeUsers::FayeActiveUsers.add(message['clientId'], user) # if not meta_channels?(message['subscription'])
        return callback.call(message)
      else
        message['error'] = "Invalid auth token"
      end
    end
    puts "Message: #{message.inspect}"
    # puts "ActiveUsers.all:#{ActiveUsers.all}"
    callback.call(message)
  end

end
