class Node < ApplicationRecord
    validates :rowNumber, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 6}
    validates :columnNumber, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 6}


end
