export DefaultArray

# To solve this problem, you'll have to improve the `struct` definition and modify/add constructors
struct DefaultArray{T,N,A<:AbstractArray{T,N}} <: AbstractArray{T,N}
    parentarray::A
    defaultvalue::T
end
function DefaultArray(parentarray::A, defaultvalue::T) where {A,T}
    Tp = promote_type(eltype(A), T)
    if Tp === eltype(A)
        pa = parentarray
    else
        pa = similar(parentarray, Tp)
        copy!(pa, parentarray)
    end
    DefaultArray{Tp,ndims(A),typeof(pa)}(pa, defaultvalue)
end

function Base.getindex(a::DefaultArray{T,N,A}, i::Vararg{Int,N}) where {T,N,A}
    checkbounds(Bool, a, i...) ? a.parentarray[i...] : a.defaultvalue
end

Base.size(a::DefaultArray) = size(a.parentarray)
