class Connect4Controller < ApplicationController

  def init
    Node.destroy_all
    # row 1
    Node.create(:rowNumber => 0, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 0, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 0, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 0, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 0, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 0, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 0, :columnNumber => 6, :belongsTo => '')
    # row 2
    Node.create(:rowNumber => 1, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 1, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 1, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 1, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 1, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 1, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 1, :columnNumber => 6, :belongsTo => '')
    # row 3
    Node.create(:rowNumber => 2, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 2, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 2, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 2, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 2, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 2, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 2, :columnNumber => 6, :belongsTo => '')
    # row 4
    Node.create(:rowNumber => 3, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 3, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 3, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 3, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 3, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 3, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 3, :columnNumber => 6, :belongsTo => '')
    # row 5
    Node.create(:rowNumber => 4, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 4, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 4, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 4, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 4, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 4, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 4, :columnNumber => 6, :belongsTo => '')
    # row 6
    Node.create(:rowNumber => 5, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 5, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 5, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 5, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 5, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 5, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 5, :columnNumber => 6, :belongsTo => '')
    # row 7
    Node.create(:rowNumber => 6, :columnNumber => 0, :belongsTo => '')
    Node.create(:rowNumber => 6, :columnNumber => 1, :belongsTo => '')
    Node.create(:rowNumber => 6, :columnNumber => 2, :belongsTo => '')
    Node.create(:rowNumber => 6, :columnNumber => 3, :belongsTo => '')
    Node.create(:rowNumber => 6, :columnNumber => 4, :belongsTo => '')
    Node.create(:rowNumber => 6, :columnNumber => 5, :belongsTo => '')
    Node.create(:rowNumber => 6, :columnNumber => 6, :belongsTo => '')

    Player.destroy_all
    Player.create(:name => 'A', :active => true, :winTimes => 0, :winner => false)
    Player.create(:name => 'B', :active => false, :winTimes => 0, :winner => false)
    redirect_to nodes_url
  end



end
