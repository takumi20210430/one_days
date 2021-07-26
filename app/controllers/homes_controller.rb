class HomesController < ApplicationController
  def top
    @article = Article.limit(10).order(" created_at DESC ")
   #10件まで表示多い
  end

  def ranking
    @all_ranks = Article.create_all_ranks
  end

end
