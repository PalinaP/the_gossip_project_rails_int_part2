class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @comment = Comment.new
    @comment.gossip_id = params[:id]
  end

  def create
    @comment = Comment.new(content:params[:content], gossip_id:params[:gossip_id]) # avec xxx qui sont les données obtenues à partir du formulaire
    @comment.commentator = User.find_by(first_name:"anonymous")

    if @comment.save # essaie de sauvegarder en base @gossip
        puts "-"*30
        puts "commentaire saved" # si ça marche, on retourne sur la page show du potin
        puts "-"*30
    else
      # sinon, on reste sur la page edit du commentaire et on affiche un message d'erreur
        puts "-"*30
        puts "big mistake"
        puts "-"*30
    end
  end

  def edit
  end

  def save
  end

  def destroy
  end
end
