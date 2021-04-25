# frozen_string_literal: true

module AttributeExtractor
  extend ActiveSupport::Concern

  def extract_attribute_from(model, attribute)
    send(model).pluck(attribute).uniq.compact.freeze
  end
end
