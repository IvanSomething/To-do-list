# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :request do
  let(:user) { create(:user) }
  let(:task_params) do
    Hash[task: { title: 'title', description: 'description', status: 'recently_added', user_id: user.id }]
  end

  describe 'POST /tasks' do
    it 'creates a new task' do
      expect do
        post '/tasks', params: task_params
      end.to change(Task, :count).by(1)
    end

    it 'attaches user to task' do
      post '/tasks', params: task_params
      expect(Task.last.user).not_to be_blank
    end
  end

  describe 'POST /tasks/:id/toggle_status' do
    let!(:task) { create(:task) }

    context 'when task is recently added' do
      it 'changes status to in progress' do
        post "/tasks/#{task.id}/toggle_status"
        expect(task.reload.status).to eq('in_progress')
      end
    end

    context 'when task is in progress' do
      subject { create(:task, :in_progress) }

      it 'changes status to done' do
        post "/tasks/#{subject.id}/toggle_status"
        expect(subject.reload.status).to eq('done')
      end
    end

    context 'when task is done' do
      subject { create(:task, :done) }
      it 'changes status to recently added' do
        post "/tasks/#{subject.id}/toggle_status"
        expect(subject.reload.status).to eq('recently_added')
      end
    end
  end

  describe 'PUT /tasks' do
    let(:task) { create(:task) }
    let(:update_params) { Hash[task: { title: new_title }] }
    let(:new_title) { 'foo' }

    it 'updates title of a task' do
      put "/tasks/#{task.id}", params: update_params
      expect(task.reload.title).to eq(new_title)
    end
  end

  describe 'DELETE /tasks/:id' do
    let!(:task) { create(:task) }

    it 'deletes a task' do
      expect do
        delete "/tasks/#{task.id}"
      end.to change(Task, :count).by(-1)
    end
  end
end
