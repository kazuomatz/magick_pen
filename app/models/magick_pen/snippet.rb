class MagickPen::Snippet < ApplicationRecord

  has_paper_trail on: [:create, :update]
  validates :pen_key, presence: true
  validates_uniqueness_of :pen_key, conditions: -> { where(is_global: true) }
  validates :action_name, presence: true, if:  ->  { is_global == false }
  validates :controller_name, presence: true, if: -> { is_global == false }
  validates_uniqueness_of :pen_key, scope:[ :action_name, :controller_name ], conditions: -> { where(is_global: false) }
  validates :content, presence: true
  validates :original_content, presence: true

  class << self
    def config
      {
          "date_format": "YYYY/MM/DD HH:mm",
          "select": {
              "class": "magick-pen-select",
              "label": {
                  "version": "バーション",
                  "original": "オリジナル",
                  "current": "最新"
              }
          },
          "buttons": {
              "edit": {
                  "class": "btn btn-primary btn-sm button is-primary is-small",
                  "icon": "fas fa-edit",
                  "label": "編集"
              },
              "update": {
                  "class": "btn btn-primary btn-sm button is-primary is-small",
                  "icon": "fas fa-upload",
                  "label": "更新"
              },
              "cancel": {
                  "class": "btn btn-secondary btn-sm button is-light is-small",
                  "icon": "fas fa-times",
                  "label": "取消"
              },
              "preview": {
                  "class": "btn btn-primary btn-sm button is-primary is-small",
                  "icon": "fas fa-eye",
                  "label": "確認"
              }
          }
      }
    end
  end
end
