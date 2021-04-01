# frozen_string_literal: true

module Email
  class Address
    VALID_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  end
end
