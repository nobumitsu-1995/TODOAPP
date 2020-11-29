class Post < ApplicationRecord

  def define_deadline
    today = DateTime.current
    min = (self.deadline - today)/60
    hour = min/60
    day = hour/24
    if day >= 0                       #締め切り前
      if day >= 1                     #締め切り1日以上前
        return "#{day.to_i}日"
      else                            #締め切り1日未満
        if hour >= 1                  #締め切り1日未満且つ一時間以上
          return "#{hour.to_i}時間"
        else                          #締め切り1日未満且つ一時間未満
          return "#{min.to_i}分"
        end
      end
    else                              #締め切り超過
      if -day >= 1                    #締め切り超過1日以上
        return "#{-day.to_i}日"
      else                            #締め切り超過1日未満
        if -hour >= 1                 #締め切り超過1日未満且つ一時間以上
          return "#{-hour.to_i}時間"
        else                          #締め切り超過1日未満且つ一時間未満
          return "#{-min.to_i}分"
        end
      end
    end
  end

end
