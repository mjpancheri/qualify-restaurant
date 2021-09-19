class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: %i[ show edit update destroy ]

  def index
    @restaurantes = Restaurante.paginate :page => params[:page], :per_page => 1
  end

  def show
  end

  def new
    @restaurante = Restaurante.new
  end

  def create
    @restaurante = Restaurante.new(restaurante_params)
    if @restaurante.save
      redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @restaurante.update_attributes(params[:restaurante])
      redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "edit"
    end
  end

  def destroy
    @restaurante.destroy
    redirect_to(:action => "index")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurante_params
      params.require(:restaurante).permit(:nome, :endereco, :especialidade, :foto)
    end
end
