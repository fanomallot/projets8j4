class EmailController < ApplicationController
  def index
  	@email = Email.all
  end
  def show
  	@email = Email.find(params[:id])
    @email.update(read: true);
  	respond_to do |format|
  		format.js { }
  	end
  end
  def create
  	@email = Email.new(object: Faker::Book.title ,
	body: Faker::Hipster.paragraph, read: false);
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
  def update
    @email = Email.find(params[:id])
    if @email.read == true
      @email.update(read: false);
    else
      @email.update(read: true);
    end
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js { }
    end

  end
  def destroy
    @email = Email.find(params[:id])
    @id = params[:id]
    puts @id
    @email.destroy
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js{}
    end
  end
end
