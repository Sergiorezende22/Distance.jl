function absolute(p1::AbstractArray)
    for x = 1:length(p1)
        p1[x] = abs(p1[x])
    end
    return p1
end # Função que faz devolve os valores absolutos do vetor

function maxArray(p1::AbstractArray)
    temp = p1[1]
    for x = 2:length(p1)
        if p1[x] > temp
            temp = p1[x]
        end
    end
    return temp
end # Função que devolve o maior numero de um array

function minArray(p1::AbstractArray)
    temp = p1[1]
    for x = 2:length(p1)
        if p1[x] < temp
            temp = p1[x]
        end
    end
    return temp
end # Função que devolve o menor numero de um array 
