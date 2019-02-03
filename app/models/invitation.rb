# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :user
  has_many :invitation_relations, dependent: :destroy
end
