class TwitsController < ApplicationController
  before_action :set_twit, only: [:show, :edit, :update, :destroy]

  # GET /twits
  # GET /twits.json
  #Полный список наших твитов
  def index
    @twits = Twit.all
  end

  # GET /twits/1
  # GET /twits/1.json
  # Показывает каждый твит
  def show
  end

  # GET /twits/new
  # Для создания нового твита
  def new
    @twit = Twit.new
  end

  # GET /twits/1/edit
  #Для редактирования существующего твита
  def edit
  end

  # POST /twits
  # POST /twits.json
  # Создает новый твит (Объект нового твита)
  def create
    @twit = Twit.new(twit_params)

    respond_to do |format|
      if @twit.save
        format.html { redirect_to @twit, notice: 'Twit was successfully created.' }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twits/1
  # PATCH/PUT /twits/1.json
  # Обновляте данные существующего твита
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to @twit, notice: 'Twit was successfully updated.' }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twits/1
  # DELETE /twits/1.json
  # Удаляет существующий твит
  def destroy
    @twit.destroy
    respond_to do |format|
      format.html { redirect_to twits_url, notice: 'Twit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Приватные методы Устанавливает твит - берет параметры сервера и дает нам редактировать/удл аоять с
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Хэш данных, нужен для создания, перехватывает заголовок
    def twit_params
      params.require(:twit).permit(:title, :content)
    end
end
