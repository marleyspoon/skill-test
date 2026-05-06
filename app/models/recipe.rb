# frozen_string_literal: true

class Recipe
  DATA_PATH = Rails.root.join('config/data/response.json')

  attr_reader :id, :title, :description, :image, :chef_name, :tags_list

  def initialize(attrs)
    @id = attrs.fetch('id')
    @title = attrs.fetch('title')
    @description = attrs['description'].to_s
    @image = attrs['image']
    @chef_name = attrs['chef_name']
    @tags_list = attrs['tags_list']
  end

  def self.all
    JSON.parse(DATA_PATH.read).map { |row| new(row) }
  end

  def self.find(id)
    all.find { |recipe| recipe.id == id }
  end

  def self.search(query)
    list = all
    q = query.to_s.strip
    return list if q.blank?

    needle = q.downcase
    list.select { |recipe| recipe.matches_search?(needle) }
  end

  def matches_search?(needle)
    title.to_s.downcase.include?(needle) ||
      description.to_s.downcase.include?(needle) ||
      chef_name.to_s.downcase.include?(needle) ||
      Array(tags_list).compact_blank.join(' ').downcase.include?(needle)
  end

  def preview(length: 120)
    return '' if description.blank?

    description.length > length ? "#{description[0, length].strip}…" : description
  end

  def tags_label
    list = Array(tags_list).compact_blank
    list.any? ? list.join(', ') : '—'
  end

  def chef_label
    chef_name.to_s.strip.presence || '—'
  end
end
