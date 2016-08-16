class PagesController < ApplicationController
  def home
    @title = "Home | About Me"
  end

  def resume
    @title = "Resume"
  end

  def portfolio
    @title = "Portfolio"
  end

  def blog
    @title = "Blog"
  end

  def interests
    @title = "Interests"
  end

  def contact
    @title = "Contact"
  end
end
