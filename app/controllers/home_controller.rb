class HomeController < ApplicationController

  def index
  end

  def software_architecture
  end

  def guide_to_web_applications
    render layout: "guide"
  end

  def privacy_policy
  end

  def tech_lingo
    @lingoes = Lingo.all
  end
end
