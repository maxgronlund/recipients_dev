class MessageSubjectsController < ApplicationController
  before_action :set_message_subject, only: [:show, :edit, :update, :destroy]


  def index
    prepare_variables
    redirect_to new_organization_message_subject_path(@organization)

  end

  # GET /message_subjects/1
  # GET /message_subjects/1.json
  def show
  end

  # GET /message_subjects/new
  def new
    prepare_variables



    #@message_subject.message_recipients.build
    #@organization    = Organization.find(params[:organization_id])
    #@message_subject = @organization.message_subjects.new()
    #@message_subject.messageble = @organization
    #@message_subject.message_contents.new
    #@recipients     = @organization.users
    #@families       = @organization.families
  end

  # GET /message_subjects/1/edit
  def edit
  end

  # POST /message_subjects
  # POST /message_subjects.json
  def create
    @recipient_ids    = []
    @organization     = Organization.find(params[:organization_id])
    @message_subject  = @organization.message_subjects.new(
      message_params
    )
    @message_subject.messageble = @organization

    if @message_subject.save
      build_message_recipients
      redirect_to organization_path(@organization)
    else
      @recipients       = @organization.users
      @families         = @organization.families
      render :new
    end





    #message_subject_params

    #@organization = Organization.find(params[:organization_id])
    #@message_subject = @organization.message_subjects.new(message_params )
    #@message_subject.messageble_id    = @organization.id
    #@message_subject.messageble_type  = @organization.class.name
    #@message_subject.user = current_user

    #redirect_to new_organization_message_subject_path(@organization)

    # if @message_subject.save
    #   redirect_to organization_path(@organization), notice: 'Message subject was successfully created.'
    # else
    #   render :new
    # end
  end

  def prepare_variables
    @recipient_ids    = []
    @organization     = Organization.find(params[:organization_id])
    @message_subject  = @organization.message_subjects.new()

    @message_subject.message_contents.new
    @message_subject.messageble = @organization
    @recipients       = @organization.users
    @families         = @organization.families
  end

  def message_params
    params_copy = message_subject_params.dup
    @recipient_ids = message_subject_params["message_recipient_ids"].reject(&:blank?)
    params_copy.delete "message_recipient_ids"
    params_copy[:user_id] = current_user.id
    params_copy

  end

  def build_message_recipients
    @recipient_ids.each do |recipient_id|
      @message_subject.message_recipients.create(
        reciveable_id: recipient_id,
        reciveable_type: 'User'
      )
    end
  end

  # PATCH/PUT /message_subjects/1
  # PATCH/PUT /message_subjects/1.json
  def update
    respond_to do |format|
      if @message_subject.update(message_subject_params)
        format.html { redirect_to @message_subject, notice: 'Message subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_subject }
      else
        format.html { render :edit }
        format.json { render json: @message_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_subjects/1
  # DELETE /message_subjects/1.json
  def destroy
    @message_subject.destroy
    respond_to do |format|
      format.html { redirect_to message_subjects_url, notice: 'Message subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_subject
      @message_subject = MessageSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_subject_params
      params.require(:message_subject)
        .permit(
          :title, :messageble_id,
          :messageble_type,
          :user_id, :organization_id,
          message_contents_attributes: [:id, :content, :user_id],
          message_recipient_ids: []

        )
    end
end


#<%= form.input :messageble_id, id: :message_subject_messageble_id %>
#
#
#<div class="field">
#  <%= form.label :user_id %>
#  <%= form.text_field :user_id, id: :message_subject_user_id %>
#</div>
#
#<div class="field">
#  <%= form.label :organization_id %>
#  <%= form.text_field :organization_id, id: :message_subject_organization_id %>
#</div>