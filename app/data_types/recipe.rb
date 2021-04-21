# frozen_string_literal: true

module DataTypes
  # Describes a Recipe Type
  class Recipe < Contentful::Entry

    # Return parsed version of an Entry as Hash
    # 
    # @returns Hash
    def as_hash
      {
        id: id,
        title: title,
        description: description,
      }
    end
  end
end
