json.extract! discussion, :id, :title, :board_id, :user_id, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
