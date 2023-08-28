class StaticPagesController < ApplicationController
  def home
    @username ||= Current.user&.name
  end
end
