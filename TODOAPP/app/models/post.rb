class Post < ApplicationRecord

  def define_deadline
    today = DateTime.current
    min = (self.deadline - today)/60
    hour = min/60
    day = hour/24
    if day >= 0
      if day >= 1
        return "#{day.to_i}日"
      else
        if hour >= 1
          return "#{hour.to_i}時間"
        else
          return "#{min.to_i}分"
        end
      end
    else
      if -day >= 1
        return "#{-day.to_i}日"
      else
        if -hour >= 1
          return "#{-hour.to_i}時間"
        else
          return "#{-min.to_i}分"
        end
      end
    end
  end
end
