module MagickPen
  class Snippet < ApplicationRecord
    has_paper_trail on: [:create, :update]
    validates :pen_key, presence: true
    validates_uniqueness_of :pen_key, conditions: -> { where(is_global: true) }
    validates :action_name, presence: true, if:  ->  { is_global == false }
    validates :controller_name, presence: true, if: -> { is_global == false }
    validates_uniqueness_of :pen_key, scope:[ :action_name, :controller_name ], conditions: -> { where(is_global: false) }
    validates :content, presence: true
    validates :original_content, presence: true

    def self.config
      Config.default
    end
  end
end
