function absolute(p1::AbstractArray)
    for x = 1:length(p1)
        p1[x] = abs(p1[x])
    end
    return p1
end # function

function maxArray(p1::AbstractArray)
    temp = p1[1]
    for x = 2:length(p1)
        if p1[x] > temp
            temp = p1[x]
        end
    end
    return temp
end

function minArray(p1::AbstractArray)
    temp = p1[1]
    for x = 2:length(p1)
        if p1[x] < temp
            temp = p1[x]
        end
    end
    return temp
end
