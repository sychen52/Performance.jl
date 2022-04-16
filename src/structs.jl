export DefaultArray

# To solve this problem, you'll have to improve the `struct` definition and modify/add constructors
struct DefaultArray{A,N,T} <: AbstractArray{T,N} where {A<:AbstractArray{T,N}}
    parentarray::A
    defaultvalue::T
end
function DefaultArray(parentarray::A, defaultvalue::T) where {A,T}
    Tp = promote_type(eltype(A), T)
    pa = convert.(Tp, parentarray)
    DefaultArray{typeof(pa),ndims(A),Tp}(pa, defaultvalue)
end

function Base.getindex(a::DefaultArray{A,N,T}, i::Vararg{Int,N}) where {A,N,T}
    checkbounds(Bool, a, i...) ? a.parentarray[i...] : a.defaultvalue
end

Base.size(a::DefaultArray) = size(a.parentarray)
