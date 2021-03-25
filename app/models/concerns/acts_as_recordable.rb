# frozen_string_literal: true

module ActsAsRecordable
  extend ActiveSupport::Concern

  included do
    # Validations
    validates :recorded_on, presence: true
  end
end
