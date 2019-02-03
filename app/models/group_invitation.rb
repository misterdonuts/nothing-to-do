# frozen_string_literal: true

class GroupInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
