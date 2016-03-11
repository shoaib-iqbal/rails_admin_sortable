require "rails_admin_sortable/engine"

module RailsAdminSortable
end

require 'rails_admin_sortable/config/sections/sortable'
require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Sortable < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :controller do
          Proc.new do
            @sortable_section =  model_config.sortable
          end
        end

        register_instance_option :object_level do
          false
        end

        register_instance_option :collection? do
          true
        end

        register_instance_option :bulkable? do
          false
        end

        register_instance_option :link_icon do
          'fa fa-list-ol'
        end

        register_instance_option :pjax? do
          false
        end

      end
    end
  end
end

