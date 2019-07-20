class FindsController < ApplicationController
  def index
    if params[:search].blank?
      @result = t "no_pages_found"
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(name) LIKE :search",
          search: "%#{@parameter}%")

      if @results.blank?
        @result = t "no_pages_found"
      end
    end
  end
end
