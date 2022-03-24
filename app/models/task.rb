# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :description, presence: true

  enum status: { 'Recently added': 0, 'In progress': 1, 'Done': 2 }

  has_and_belongs_to_many :users
end
