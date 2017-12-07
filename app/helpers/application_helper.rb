module ApplicationHelper
  def app_title
    t('app_name')
  end

  def black_list_alerts
    ["You need to sign in or sign up before continuing."]
  end
end
