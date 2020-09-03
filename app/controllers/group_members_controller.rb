class GroupMembersController < ApplicationController
  def index
    @group = GroupMember.find_by(group_id: params[:group_id]).group
    @members = GroupMember.members(params[:group_id])
    @unmembers = GroupMember.unmembers(params[:group_id])
  end

  def create
    @group_member = GroupMember.new(group_id: params[:group_id], member_id: params[:member_id])

    if @group_member.save
      flash[:success] = 'グループ参加に成功しました' 
    else
      flash[:failed] = 'グループ参加に失敗しました' 
    end
    redirect_to group_members_path(group_id: params[:group_id])
  end
  def destroy
    group_member = GroupMember.where(group_id: params[:group_id], member_id: params[:id]).first
    group_member.destroy
    redirect_to group_members_path(group_id: params[:group_id])
  end

  def add_head
    @organizer = GroupMember.chose_organizer(params[:group_id])
    if @organizer.blank?
      flash[:failed] = '登録できるメンバーがいません' 
    else
      @organizer.set_organizer
    end
      redirect_to group_members_path(group_id: params[:id])
  end
end
