require 'rails_admin/config/sections/base'

module RailsAdmin
  module Config
    module Sections
      class Sortable < RailsAdmin::Config::Sections::Base

        register_instance_option :label_method do
          nil
        end

        register_instance_option :position_method do
          nil
        end

      end
    end
  end
end
