require "rails/generators"

module MagickPen
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../app/models/magick_pen', __FILE__)

    class_option "with-migrate", type: :boolean

    def start
      puts "Start installing Magick Pen..."
      puts "*" * 80 + "\n"
    end

    def check_paper_trail
      puts "Paper Trail Install...."
      Dir.chdir(Rails.root) do
        `bundle exec rails generate paper_trail:install`
      end
    end

    def install_migrations
      puts "Copying over Magick Pen migrations..."
      Dir.chdir(Rails.root) do
        `bundle exec rake magick_pen_engine:install:migrations`
      end
    end

    def copy_config
      file = File.join(Rails.root,'app','models','magick_pen', 'config.rb')
      template 'config.rb', file
    end

    def run_migrations
      return unless options["with-migrate"]
      puts "Running rake db:migrate"
      `bundle exec rake db:migrate`
    end

    def install_npm
      puts "Running npm install vue_magick_pen"
      `npm install vue-magick-pen`
    end

    def finished
      puts "\n" + ("*" * 80)
      puts "Done! Magick Pen has been successfully installed."
    end
  end
end
