# frozen_string_literal: true

class Recipe < ApplicationRecord
  FIXTURE_PATH = Rails.root.join('config/data/response.json')

  def self.import_from_fixture!
    transaction do
      delete_all
      JSON.parse(FIXTURE_PATH.read).each do |row|
        create!(
          id: row.fetch('id'),
          title: row.fetch('title'),
          description: row['description'].to_s,
          image: row['image'],
          chef_name: row['chef_name'],
          tags_list: row['tags_list']
        )
      end
    end
  end

  def self.search(query)
    q = query.to_s.strip
    return all if q.blank?

    pattern = "%#{sanitize_sql_like(q.downcase)}%"
    where(
      <<~SQL.squish,
        LOWER(title) LIKE :pattern
        OR LOWER(COALESCE(description, '')) LIKE :pattern
        OR LOWER(COALESCE(chef_name, '')) LIKE :pattern
        OR LOWER(COALESCE(tags_list::text, '')) LIKE :pattern
      SQL
      pattern: pattern
    )
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
