class LinesController < ApplicationController
  def edit
    
  end

  def update
    if current_user.update(lines_params)
      redirect_to root_path, notice: '登録路線を更新しました'
    else
      render :edit
    end
  end

  private
  def lines_params
    params.require(:user).permit(:name, line_ids: [])
  end

end
