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
            @sortable_section = model_config.sortable
            @objects = list_entries.sort { |a,b| a.send(@sortable_section.position_method) <=> b.send(@sortable_section.position_method) }

            if request.post?
              original_model =  @abstract_model.model

              params[:data].each do |key,value|
                object = original_model.find(value[:id])
                object.send("#{@sortable_section.position_method}=", value[:position])
                object.save!
              end

              respond_to do |format|
                format.json { render :json => { status: 'OK' }  }
              end
            end
          end
        end

        register_instance_option :visible? do
          !bindings[:abstract_model].config.sortable.position_method.nil?
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

        register_instance_option :http_methods do
          [:get, :post, :put]
        end

      end
    end
  end
end