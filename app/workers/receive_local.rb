module Workers
  class ReceiveLocal < Base
    sidekiq_options queue: :receive_local

    def perform(object_class_string, object_id, recipient_user_ids)
      object = object_class_string.constantize.find(object_id)
      # TODO: create visibilities
      # TODO: send notifications
    rescue ActiveRecord::RecordNotFound # Already deleted before the job could run
    end
  end
end
