def deck(cards)
    if cards.is_a?(String)
        return "random"
    elsif cards.is_a?(Array)
        cards.each do |v|
            v.upcase!
        end
        return cards
    else
        return false
    end
end