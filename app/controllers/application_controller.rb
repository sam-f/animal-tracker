# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def not_found(exception = nil)
    respond_to do |format|
      format.html { render "not_found", status: 404 }
      format.any { head 404 }
    end
  end
end
