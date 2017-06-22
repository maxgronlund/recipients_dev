class FamilyAppendToMailsController < ApplicationController


  def show
    organization = Organization.find(append_to_mail_params[:organization_id])
    family = organization.families.find(append_to_mail_params[:id])
    @recipient_ids = family.users.pluck(:id)
  end

  private

  def append_to_mail_params
    params.permit!
  end
end
