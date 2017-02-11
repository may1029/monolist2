class RankingsController < ApplicationController
  before_action :logged_in_user

  def have
    # @have_items = Ownership.find_by(type: 'Have')
    # puts @have_items
    @items = Have.select('item_id').group(:item_id).limit(10)
    @have_ranking = @items.count.sort_by{|_, v| -v }

    render 'have_ranking'
  end

  def want
   # @have_items = Ownership.find_by(type: 'Have')
    # puts @have_items
    @items = Want.select('item_id').group(:item_id).limit(10)
    @want_ranking = @items.count.sort_by{|_, v| -v }

    render 'want_ranking'
  end

end
