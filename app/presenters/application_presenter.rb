# frozen_string_literal: true

class ApplicationPresenter
  EXCEPTS = %i[].freeze

  def initialize(record)
    @record = record
  end

  private

  attr_reader :record

  def beautify_context(hash, created_at = false)
    hash = hash.except(*EXCEPTS)
    hash = hash.except(:created_at) if created_at
    hash
  end

  def beautify(association, excepts)
    association.attributes.symbolize_keys.except(*excepts)
  end
end
