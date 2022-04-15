export sequence_of_three, alternate_items

function sequence_of_three(start::T) where {T}
    out = T[]
    push!(out, start, start + 1, start + 2)
    return out
end

function alternate_items(nrepeats::Integer, item1::T1, item2::T2) where {T1,T2}
    out = Union{T1,T2}[]
    for _ = 1:nrepeats           # _ is often used for a variable you'll not use again
        push!(out, item1, item2)
    end
    return out
end
