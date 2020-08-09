module ApplicationHelper
    def to_second(minsecond)
        (minsecond.to_f / 1000).round(2)
    end

    def map_second(strs)
        arr = strs.split(",").map {|d| to_second d }
        arr.join(", ")
    end
end
