# frozen_string_literal: true

class CreateUsersTasksJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tasks
  end
end
