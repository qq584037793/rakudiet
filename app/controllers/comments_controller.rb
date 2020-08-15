class CommentsController < ApplicationController
    before_action :logged_in_user

    def create
        @cook = Cook.find(params[:cook_id])
        @user = @cook.user
        @comment = @cook.comments.build(user_id: current_user.id, content: params[:comment][:content])
        if !@cook.nil? && @comment.save
          flash[:success] = "コメントを追加しました！"
        else
          flash[:danger] = "空のコメントは投稿できません。"
        end
        redirect_to request.referrer || root_url
    end

    def destroy
        @comment = Comment.find(params[:id])
          @cook = @comment.cook
          if current_user.id == @comment.user_id
            @comment.destroy
            flash[:success] = "コメントを削除しました"
          end
          redirect_to cook_url(@cook)
        end

end

