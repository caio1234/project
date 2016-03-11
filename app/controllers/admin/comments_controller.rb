class Admin::CommentsController <  Admin::AdminController
  
#	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
# 
  #before_action :authenticate_user!

	# user_signed_in?

	 #current_user

	# user_session
	
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to admin_article_path(@article)
  end
	
	def destroy
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.find(params[:id])
	    @comment.destroy
	    redirect_to admin_article_path(@article)
	  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end