def deck(cards)
    if cards.is_a?(String)
        return "random"
    elsif cards.is_a?(Array)
        cards.each do |v|
            v.upcase!
        end
        temp = cards.length
        cards.uniq!
        unless cards.length == temp
            return false
        end
        return cards
    else
        return false
    end
end