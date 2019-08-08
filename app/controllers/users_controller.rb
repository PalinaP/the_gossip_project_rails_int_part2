class UsersController < ApplicationController

  def index
    # Méthode qui récupère tous les users et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    # Méthode qui récupère le user concerné et l'envoie à la view show (show.html.erb) pour affichage
      @author = User.find_by(id:params[:id])
  end

  def new
    # Méthode qui crée un user vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @user = User.new
  end

  def create
    # Méthode qui créé un user à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le user créé)
    @user = User.new(first_name:params[:first_name], last_name:params[:last_name], age:params[:age], email:params[:email], password:params[:password]) # avec xxx qui sont les données obtenues à partir du formulaire

    # on teste si la ville existe déjà, sinon on la créé en base
    if City.find_by(name:params[:city], zip_code:params[:zip_code]) == nil
      user_city = City.create(name:params[:city], zip_code:params[:zip_code])
    end
    # on affecte la ville au nouveau user
    @user.city_id = user_city.id

    if @user.save # essaie de sauvegarder en base @gossip
      session[:user_id] = @user.id
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash.now[:danger] = "Erreur de création de compte utilisateur !"
      render :new
    end


  end

  def edit
    # Méthode qui récupère le user concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le user à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le user modifié)
  end

  def destroy
    # Méthode qui récupère le user concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
