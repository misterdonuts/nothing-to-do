# frozen_string_literal: true

json.extract! group_invitation, :id, :group_id, :user_id, :sender_id, :status, :created_at, :updated_at
json.url group_invitation_url(group_invitation, format: :json)
