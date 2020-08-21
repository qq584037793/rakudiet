class CooksController < ApplicationController
    before_action :logged_in_user
    def new
      @cook = Cook.new
      @cook.ingredients.build
    end
    
    def index
      @cook = Cook.new
    end
    
    def show
      @cook = Cook.find(params[:id])
      @comment = Comment.new
    end
    
    def create
      @cook = current_user.cooks.build(cook_params)
      if @cook.save
        flash[:success] = "料理が登録されました！"
        redirect_to cook_path(@cook)
      else
        render 'cooks/new'
      end
    end
    
    def edit
      @cook = Cook.find(params[:id])
    end

    def update
      @cook = Cook.find(params[:id])
      if @cook.update_attributes(cook_params)
        flash[:success] = "料理情報が更新されました！"
        redirect_to @cook
      else
        render 'edit'
      end
    end
    
    def destroy
      @cook = Cook.find(params[:id])
      if current_user.admin? || current_user?(@cook.user)
        @cook.destroy
        flash[:success] = "料理が削除されました"
        redirect_to request.referrer == user_url(@cook.user) ? user_url(@cook.user) : root_url
      else
        flash[:danger] = "他人の料理は削除できません"
        redirect_to root_url
      end
    end
    
    private

    def cook_params
      params.require(:cook).permit(:name, :description, :portion, :tips,
                                   :reference, :required_time, :popularity,
                                   :cook_memo, :picture,ingredients_attributes: [:id, :name, :quantity])
    end
    
    
end
