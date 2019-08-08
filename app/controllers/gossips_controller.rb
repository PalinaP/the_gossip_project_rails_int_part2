class GossipsController < ApplicationController

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @number_potin = Gossip.all.length
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find_by(id:params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(title:params[:title], content:params[:content]) # avec xxx qui sont les données obtenues à partir du formulaire
    @gossip.author = User.find_by(first_name:"anonymous")

    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to({ :action=>'index' }, :alert => "save")  # si ça marche, il redirige vers la page d'index du site
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :new
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find_by(id:params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @gossip = Gossip.find_by(id:params[:id])
    if @gossip.update(title:params[:title], content:params[:content])
      redirect_to({ :action=>'show' }, :alert => "success")
    else
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find_by(id:params[:id])
    @gossip.destroy

    redirect_to({ :action=>'index' }, :alert => "delete")

  end
end
