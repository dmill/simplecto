class HomeController < ApplicationController

  def index
  end

  def software_architecture
  end

  def privacy_policy
  end

  def tech_lingo
    @lingoes = Lingo.all
  end
end
