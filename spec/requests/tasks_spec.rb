require 'rails_helper'

RSpec.describe TasksController, type: :request do
    let(:user) { create(:user) }
    let(:task_params) { Hash[task: { title: 'title', description: 'description', status: 'recently_added' }] }
    
    describe 'POST /tasks' do
        it 'creates a new task' do
          expect do
            post '/tasks', params: task_params
          end.to change(Task, :count).by(1)
        end
    
        #it 'attaches user to campaign' do
         # post '/api/campaigns', params: campaign_params
        # # expect(Campaign.last.admin_users).not_to be_blank
        #end
      #end
    
      #describe 'DELETE api/campaigns/:id' do
        #let!(:campaign) { create(:campaign, admin_users: [admin_user]) }
    
        #it 'deletes a campaign' do
         # expect do
            #delete "/api/campaigns/#{campaign.id}"
          #end.to change(Campaign, :count).by(-1)
        #end
    end
end
