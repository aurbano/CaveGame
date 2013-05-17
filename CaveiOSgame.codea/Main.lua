-- Ported from JavaScript by Chevi

-- Use this function to perform your initial setup
function setup()
    print("Touch anywhere to start")
    displayMode(FULLSCREEN)
    -- setup vars
    res = 2
    score=0
    speed = 3 -- cave x speed (new cave portions per frame)
    gravity = 0.2
    motor = 0.8
    scorePerLevel = 100
    
    -- CAVE DATA
    cave = {} -- Height of columns
    --currentLevel = Cave()
    --config
    level = 1
    minStep = 10
    maxStep = 100
    maxInc = 5
    minh = 183
    cave[0] = 200
    
    incc = math.random(minStep,maxStep) -- Counter of increments allowed
    incDir = 1 -- Direction of increments
    math.randomseed(level*score+os.time())
    -- Generamos los niveles
    for a=1, WIDTH/res do
        push()
    end
    
    -- HELI DATA
    heli = {}
    heli["x"] = 0
    heli["y"] = 0
    heli["s"] = 0.02 --speed
    heli["a"] = 0.01 --acceleration

end
-- This function gets called once every frame
function draw()
    score = score+1
    -- This sets a light background color 
    background(0, 0, 0, 255)
    sprite("SpaceCute:Background",0,0,WIDTH*2,HEIGHT*2)
    
    -- This sets the line thickness
    stroke(255, 255, 255, 255)
    strokeWidth(0)
    fill(255, 255, 255, 255)
    pushMatrix()
    translate(0,HEIGHT*0.5)

    -- Do your drawing
    -- Store the middle line for collision also
    for i,h in ipairs(cave) do
        rect(i*res,-h/2,res+1.850,h)
        if i==cave.length then
            -- Middle value
            middle = 500
        end
    end
    
    pushMatrix()
    translate(WIDTH/2,heli["y"])
    angle = -heli["s"]*5
    if angle > 90 then
        angle = 90
    end
    if angle < -90 then
        angle = -90
    end
    rotate(angle)
    -- heli
    sprite("SpaceCute:Rocketship",8,0,90)
    -- update data
    if CurrentTouch.state == 0 or 
       CurrentTouch.state == 1 then
        heli["a"] = -motor
    else
        heli["a"] = gravity
    end
    heli["y"] = heli["y"]-heli["s"]
    heli["s"] = heli["s"]+heli["a"]+gravity
    
    popMatrix()
    popMatrix()
    
    if heli["y"] < - HEIGHT/2 then
        heli["y"] = -HEIGHT/2
        heli["s"] = 0
    end
    
    if heli["y"] > HEIGHT/2 then
        heli["y"] = HEIGHT/2
        heli["s"] = -0.1*heli["s"]
    end
    
    if heli["y"] >= 600 then
        -- Game over
        text("Game over")
    end
    
    -- stars
    --sprite("Planet Cute:Star",WIDTH*math.random(),HEIGHT*math.random(),30)
    
    pushStyle()
    strokeWidth(1)
    stroke(0, 0, 0, 255)
    -- score
    font("Futura-CondensedMedium")
    fontSize(24)
    text("Score: "..score,WIDTH-50,HEIGHT-25)
    text("Level "..level,39,HEIGHT-25)
    
    for i=0,speed do
        table.remove(cave,1)
        push()
    end
    -- increase difficuly
    if score/level>scorePerLevel then
        level = level+1
        if speed<10 then
            speed = speed+1
        end
        if minh > 80 then
            minh = minh - 10
        end
    end
end
