class CommentsController < ApplicationController
  def create
    comment = Comment.new comment_params
    respond_to do |format|
      if comment.save
        @target = comment.target
        create_acivity comment, Comment.class.name, comment.target.club, current_user
        format.js
      else
        format.js{alert(t("comment_fail"))}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:target_id,
      :target_type, :content).merge! user_id: current_user.id
  end
end
