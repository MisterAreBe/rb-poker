def deck()
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
    suites = ["C", "D", "H", "S"]
    new_arr = []
    suites.each do |v|
        values.each do |card|
            new_arr << "#{card}#{v}"
        end
    end
    new_arr
end