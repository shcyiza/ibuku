class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy, :link_to_ideas]

  # GET /notes
  # GET /notes.json
  def index
    @search = Note.where(user: current_user).search do
      fulltext params[:search]
    end
    @note = Note.new
    @origins_notes = @search.results.group_by(&:origin)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @origin = @note.origin
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @origin = @note.origin
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        @origin = @note.origin
        format.html { redirect_to :back, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        @origin = @note.origin
        format.html { redirect_to @origin, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @origin }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def link_to_ideas
    @link = Link.new
    @ideas = Idea.linkable_for @note, current_user
    @linked_ideas = Idea.linked_to @note, current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:origin_id, :reference, :quote, :commentary, :page)
    end
end
