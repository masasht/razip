module UsersHelper
  def user_icon(user)
    if user.user_class == "ワークス"
      "works"
    elsif user.user_class == "カツカツ"
      "katsu2"
    elsif user.user_class == "そこそこ"
      "soko2"
    elsif user.user_class == "まったり"
      "mattari"
    elsif user.user_class == "初心者"
      "begginer"
    else
      "misettei"
    end
  end
end
