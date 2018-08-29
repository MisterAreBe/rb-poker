def deck(cards)
    if cards.is_a?(String)
        return "random"
    elsif cards.is_a?(Array)
        cards.each do |v|
            v.upcase!
            if v.length != 2
                return false
            end
        end
        temp = cards.length
        cards.uniq!
        if cards.length > 5
            return false
        elsif cards.length != temp
            return false
        end
        return cards
    else
        return false
    end
end