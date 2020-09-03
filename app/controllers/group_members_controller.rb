class GroupMembersController < ApplicationController
  def index
  end

  def show
    @group = GroupMember.find_by(group_id: params[:id]).group
    @members = GroupMember.members(params[:id])
    @unmembers = GroupMember.unmembers(params[:id])
  end
end
