class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]

  layout "user"

  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = Concert.all
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show

  end

  # GET /concerts/new
  def new
    # byebug
    @concert = Concert.new
    @paperclip_image = PaperclipImage.new
    # @concert.paperclip_image << @paperclip_image
    puts session[:user_id]
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts
  # POST /concerts.json
  def create

    @concert = Concert.new(concert_params)
    @paperclip_image = PaperclipImage.new(paperclip_image_params)
    @paperclip_image.concert = @concert

    # Need to push the image to S3 now.
    

    respond_to do |format|
      if @concert.save && @paperclip_image.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      #params.fetch(:concert, {})
      params.require(:concert).permit(:band, :venue, :date, :notes, :user_id)
    end

    def paperclip_image_params
      params.require(:paperclip_image).permit(:asset)
      # params.fetch(:paperclip_image, {})
    end

end
