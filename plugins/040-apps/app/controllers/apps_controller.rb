# Amahi Home Server
# Copyright (C) 2007-2013 Amahi
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License v3
# (29 June 2007), as published in the COPYING file.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# file COPYING for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this program; if not, write to the Amahi
# team at http://www.amahi.org/ under "Contact Us."

class AppsController < ApplicationController

  before_filter :admin_required

  def index
    set_title t('apps')
    @apps = App.available
  end

  def installed
    set_title t('apps')
    @apps = App.latest_first
  end

  def install_via_daemon
    identifier = params[:id]
    @app = App.find_by_identifier identifier
    App.install_via_daemon identifier unless @app
  end

  def install_progress
    identifier = params[:id]
    @app = App.find_by_identifier identifier

    if @app
      @app.reload
      @progress = @app.install_status
      @message = @app.install_message
    else
      @progress = App.installation_status identifier
      @message = App.installation_message @progress
    end
  end

  def uninstall_via_daemon
    identifier = params[:id]
    @app = App.find_by_identifier identifier
    @app.uninstall_via_daemon if @app
  end

  def uninstall_progress
    identifier = params[:id]
    @app = App.find_by_identifier identifier
    if @app
      @app.reload
      @progress = @app.install_status
      @message = @app.uninstall_message
    else
      @message = t('application_uninstalled')
      @progress = 0
    end
  end


  def toggle_in_dashboard
    identifier = params[:id]
    app = App.find_by_identifier identifier
    if app.installed
      app.show_in_dashboard = ! app.show_in_dashboard
      app.save
      @saved = true
    end
    render :json => { :status => @saved ? :ok : :not_acceptable }
  end

end
