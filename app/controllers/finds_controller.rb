class FindsController < ApplicationController
  def index
    if params[:search].blank?
      @result = t "no_pages_found"
    else
      @parameter = params[:search].downcase
      @results = User.find_user

      @result = t "no_pages_found" if @results.blank?
    end
  end
end
