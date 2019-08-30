class EmailController < ApplicationController
  def index
  	@email = Email.all
  end
  def show
  	@email = Email.find(params[:id])
  	respond_to do |format|
  		format.js { }
  	end
  end
  def create
  	@email = Email.new(object: Faker::Book.title ,
	body: Faker::Hipster.paragraph);
	if @email.save
		respond_to do |format|
			format.html{ redirect_to root_path }
			flash[:success]="Email recu"
			format.js{}
		end
	else
		redirect_to root_path
		flash[:dander]="Erreur"
	end
  end
  def destroy
  end
end
