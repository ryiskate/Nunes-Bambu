class Reply < ApplicationRecord
  belongs_to :replyable, polymorphic: true
end
