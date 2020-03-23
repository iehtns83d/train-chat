class StationsController < ApplicationController
  before_action :set_line
  
  def index
    
  end

  private

  def set_line
    @line = Line.find(params[:line_id])
  end
end
