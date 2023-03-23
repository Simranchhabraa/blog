class Idproof < ApplicationRecord
    belongs_to :merchant
    mount_uploader :document, ImageUploader
    enum :status, { "Pending": "Pending", "Accept": "Accept", "Reject": "Reject"},_default: :"Pending"
end
