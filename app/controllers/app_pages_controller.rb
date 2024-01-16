class AppPagesController < ApplicationController
    before_action :authenticate_user!

    def home
        @username ||= Current.user.name
        if Current.user.piggybanks.any?
            @piggybanks = Current.user.piggybanks.order(:created_at)
            @total_saved = @piggybanks.inject(0) { |sum, el| sum + ((el.exclude_from_totals) ? 0 : el.current_amount)  }
            @total_needed = @piggybanks.inject(0) { |sum, el| sum + ((el.exclude_from_totals) ? 0 : el.goal_amount) }
        end

        @custom_js = true
    end
end
