module SalaryhoursHelper
    def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
      end

      def hourly_salary
        hourly_rate = (current_user.salary / (252 * hours_per_day))
        hourly_rate
      end

      def hours_per_day
        total_time = (current_user.start_time - current_user.end_time).abs
        total_time
      end

      def money_lost(hours)
        (hours * hourly_salary).round(2)
      end

      def max_hours
        maximum_hours = 0
        Salaryhour.all.each do |salaryhour|
          if salaryhour.user_id == current_user.id
            maximum_hours += salaryhour.hours
          else
            maximum_hours = maximum_hours
          end
        end
        return maximum_hours
      end

      def max_cash
        if max_hours == 0
          return 0
        else
          (max_hours * hourly_salary).round(2)
        end
      end
      
      def welcome_message
        messages = ["diversity is our strength", "taxation is theft", "there are cretins in Stratford Westfield", 
        "we have a badass over here", "QL walks really slowly"]
        messages.sample
    end
end
