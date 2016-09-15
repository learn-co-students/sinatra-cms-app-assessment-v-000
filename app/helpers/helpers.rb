class Helpers

  def self.redirect_if_not_logged_in
    if !logged_in?
      redirect "/login?error=You have to be logged in to do that"
    end
  end

  def self.current_user(session_info)
    @user = User.find(session_info[:user_id])
  end

  def self.logged_in?(session_info)
    if session_info[:user_id] != nil
      true
    else
      false
    end
  end

end
