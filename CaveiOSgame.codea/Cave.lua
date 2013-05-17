--Cave = class()

function generateCave()
    --config
    level = 1
    minStep = 10
    maxStep = 100
    maxInc = 5
    minh = 183
    cave[0] = 200
    
    incc = math.random(minStep,maxStep) -- Counter of increments allowed
    incDir = 1 -- Direction of increments
    math.randomseed(level*score)
    -- Generamos los niveles
    for a=1, WIDTH/res do
        Cave:push()
    end
end

function push()
    elem = table.maxn(cave)
    if elem == 0 then
        table.insert(cave,200)
        return true
    end
    inc = math.random(0,maxInc)
    if incc == 0 then
        incc = math.random(minStep,maxStep)
        if math.random(0,1)==1 then
            incDir = -incDir
        end
    else
        incc= incc - 1
    end
    h = cave[elem-1]+inc*incDir
    if h > HEIGHT then
        h = HEIGHT/2
        incDir = -incDir
    end
    if h < minh then
        h = minh
        incDir = -incDir
    end
    table.insert(cave,h)
end

function pop()
    table.remove(cave,0)
end