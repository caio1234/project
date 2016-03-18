class Admin::ArticlesController <  Admin::AdminController
  
	
	#http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	#before_action :authenticate_user!

	# user_signed_in?

	#current_user

	# user_session
	
	def index
		@articles = Article.all
	end
	
	def show
		teste
		@article = Article.find(params[:id])
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def new
		@article = Article.new
	end
	
	def create
		@article = Article.new(article_params)
		if @article.save
			#redirect_to @article, location: admin_articles_path
			redirect_to admin_article_path(@article)
		else
			render 'new'
		end
	end
	
	def update
		@article = Article.find(params[:id])
 
		if @article.update(article_params)
			#redirect_to @article, location: admin_articles_path
			redirect_to admin_article_path(@article)
		else
			render 'edit'
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
 
		redirect_to admin_articles_path
	end
	
	def teste
		@user = User.first
		UserMailer.welcome_email(@user)
	end
	
	private
	def article_params
		params.require(:article).permit(:title, :text, :image)
	end	
		
end