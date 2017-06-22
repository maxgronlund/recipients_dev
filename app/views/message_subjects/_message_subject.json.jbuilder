json.extract! message_subject, :id, :title, :messageble_id, :messageble_type, :user_id, :organization_id, :created_at, :updated_at
json.url message_subject_url(message_subject, format: :json)
