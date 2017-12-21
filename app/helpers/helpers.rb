class Helpers

  def self.current_user(session)
    @user = User.find(session[:user_id])
  end

  def self.logged_in?(session)
    if session[:user_id] != nil
      true
    else
      false
    end
  end

end
