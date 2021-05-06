module MagickPen
  class Config
    def self.default
      {
          date_format: "YYYY/MM/DD HH:mm",
          select: {
              class: "magick-pen-select",
              label: {
                  version: I18n.t('magick_pen.version'),
                  original: I18n.t('magick_pen.original'),
                  current: I18n.t('magick_pen.current'),
              }
          },
          buttons: {
              # Button Class - compatible width Bootstrap and  Bulma)
              # Icon Class - compatible with Fontawesome 5
              edit: {
                  class: "btn btn-primary btn-sm button is-primary is-small",
                  icon: "fas fa-edit",
                  label: I18n.t('magick_pen.buttons.edit')
              },
              update: {
                  class: "btn btn-primary btn-sm button is-primary is-small",
                  icon: "fas fa-upload",
                  label:I18n.t('magick_pen.buttons.update')
              },
              cancel: {
                  class: "btn btn-secondary btn-sm button is-light is-small",
                  icon: "fas fa-times",
                  label: I18n.t('magick_pen.buttons.cancel')
              },
              preview: {
                  class: "btn btn-primary btn-sm button is-primary is-small",
                  icon: "fas fa-eye",
                  label: I18n.t('magick_pen.buttons.preview')
              }
          }
      }
    end
  end
end
