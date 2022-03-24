# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :description, presence: true

  enum status: { recently_added: 0, in_progress: 1, done: 2 }

  has_and_belongs_to_many :users
end
