class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  delegate :whitelisted_columns, to: :class

  def whitelisted_attributes
    attributes.slice(*whitelisted_columns)
  end

  def attributes
    super.with_indifferent_access
  end

  class <<self
    def member_name
      name.downcase.singularize
    end

    def collection_name
      name.downcase.pluralize
    end

    def whitelisted_columns
      @whitelisted_columns ||= []
    end

    def whitelisted_columns=(columns)
      raise "columns must be an array" if !columns.is_a?(Array)
      @whitelisted_columns = columns
    end
  end

end
