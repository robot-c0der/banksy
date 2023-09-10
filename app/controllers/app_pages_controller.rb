

class AppPagesController < ApplicationController
    def home
        @username ||= Current.user&.name
        @piggybanks = Current.user.piggybanks
        @total_saved = @piggybanks.inject(0) { |sum, el| sum + el.current_amount }
        @total_needed = @piggybanks.inject(0) { |sum, el| sum + el.goal_amount }
    end
end
