# -*- coding: utf-8 -*-
class PagesController < ApplicationController
  def home
  end

  def ovos
  	redirect_to "/registrar-hora-extra"
  end
end
