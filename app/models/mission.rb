class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates_presence_of :name

  validates :scientist_id, uniqueness: { scope: :name }
end
