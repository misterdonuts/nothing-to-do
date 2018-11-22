json.extract! user, :id, :account_name, :user_name, :icon_path, :invite_num, :be_invited_num, :accept_num, :created_at, :updated_at
json.url user_url(user, format: :json)
