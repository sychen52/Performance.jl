export getchar, set_homedir, get_homedir


function getchar(idx)
    charset = 'a':'z'
    charset[idx]
end

const homedir = Ref{String}("wrong")

function set_homedir(path)
    global homedir[] = path
end
get_homedir() = homedir[]

