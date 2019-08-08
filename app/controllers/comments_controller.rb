class CommentsController < ApplicationController

  # on vérifie que l'utilisateur est loggué pour créer un commentaire
  # before_action :authenticate_user, only: [:new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @comment = Comment.new(content:params[:content], gossip_id:params[:gossip_id]) # avec xxx qui sont les données obtenues à partir du formulaire
    @comment.commentator = current_user

    if @comment.save # essaie de sauvegarder en base @gossip
      redirect_to gossip_url(params[:gossip_id]), :alert => "comment_saved"
    else
      # sinon, on reste sur la page edit du commentaire et on affiche un message d'erreur
      redirect_to gossip_url(params[:gossip_id]), :alert => "comment_error"
    end
  end

  def edit
      @comment = Comment.find_by(id:params[:id])
  end

  def update
    @comment = Comment.find_by(id:params[:id])
    if @comment.update(content:params[:content])
      redirect_to gossip_url(params[:gossip_id]), :alert => "comment_saved"
    else
      redirect_to gossip_url(params[:gossip_id]), :alert => "comment_error"
    end
  end


  def save
  end

  def destroy
    @comment = Comment.find_by(id:params[:id])
    gossip_id = @comment.gossip_id
    @comment.destroy


    redirect_to gossip_url(gossip_id), :alert => "comment_deleted"
  end



end
