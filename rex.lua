local player = game.Players.LocalPlayer
local studs = 50 -- How many studs forward
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Mine = workspace:WaitForChild("Mine")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local textObject = game:GetService("Players").LocalPlayer.PlayerGui.Main.PrismOfChaosUI.Chaos.Progress.Text
local remoteEvent = ReplicatedStorage.PickaxeRemotes.PrismOfChaos_Chaotization
local isRunning = true
local isMoon = false


local layernumber = 7075
local orewanted = "Magma"
local url = "https://discord.com/api/webhooks/1027015618379141160/1U4txNcQuyuVwhtXuXVV2S1ROy7vZmzkG6y5Ew8VQIVPt6w63SFSbtQ5j0gapCPVdKbv"
local TELEPORT_CHECK_INTERVAL = 1  -- Assuming you want to check roughly every frame
local MINING_CHECK_INTERVAL = 1  -- Check every second

game:GetService("ReplicatedStorage").GenerateTP:FireServer(layernumber)

local WhiteList = {}
for _, oreName in ipairs({
"Chiron",
"Radisol",
"Aurutine",
"Protoplanetary Disk",
"Oligoclase",
"Sphalerite",
"Diopside",
"Lepidolite",
"Chlorodyrill",
"Ekanite",
"Scapolite",
"Violumina",
"Powder Snow",
"Cyprine",
"Andesine",
"Xenotime",
"Sodium",
"Amber",
"Bismuth",
"Olivine",
"Thorium",
"Obsidian Glass",
"Sapphire",
"Palladium",
"Jaxite",
"Chrome",
"Diamond",
"Ancient Bronze",
"Ocean Jasper",
"Cobalt",
"Chroma Contaris",
"Lumbonium",
"Turquoise",
"Radium",
"Javanite",

--Rare
"Heidalium",
"Cinnabar",
"Blue Giant",
"Epidote",
"Aventurine",
"Cirelin",
"Demantoid",
"Shroomite",
"Arctic Crystal",
"Apatite",
"Azurite",
"Amazonite",
"Eboxylite",
"Chrysoberyl",
"Corrodine",
"Sporgilian",
"Musgravite",
"Uranium",
"Magnesium",
"Corroplat",
"Vegentium",
"Core Fragment",
"Bluesteel",
"Painite",
"Legacy Jet",
"Osmium",
"Pyrite",
"Legacy Cryotic",

--Master
"Illuded Light",
"Luminaweb",
"Messier 92",
"Rosaraldyx",
"Quadiol",
"Argon",
"Xenon",
"Radon",
"Benitoite",
"Phendium",
"Shimmersite",
"Citrine",
"Aquintite",
"Pleskite",
"Plerivium",
"Lecilux",
"Legacy Galaxite",
"Tektite",
"Delectium",
"Leryium",
"Legacy Zefendium",
"Incinderium",
"Gilded Gold",
"Petrified Wood",
"Black Diamond",
"Sunstone",
"Adurite",
"Coldfirium",
"Viridian",
"Cerrusite",
"Vitridian",
"Alexandrite",
"Ultranium",
"Chambersite",
"Solid Bromine",

--Surreal
"Ridalite",
"Cestilade",
"Protonium",
"Ignacaelum",
"Exoflame",
"Fortinium",
"Violixium",
"Lotivium",
"Tealine",
"Calite",
"Condensium",
"Auroralium",
"Culindrene",
"Fluorite",
"Versulium",
"Intoxium",
"Tanzanite",
"Spatializine",
"EDMium",
"Electrolium",
"Deathinium",
"Rainbonite",
"Elusium",
"Elysian",
"Promethium",
"Jet",
"Legacy Newtonium",
"Frostical",
"Vanadinite",
"Legacy Promethium",
"Uldarite",

--Mythic
"Vexerite",
"Void's Iris",
"Fracidial",
"Ignisaxum",
"Cometryx",
"Mycerian",
"Chromavitrite",
"The Nightmare",
"Divinushield",
"The Dream",
"Nitoril",
"Aquatic Vortex",
"Coldstorm",
"Plasmal",
"Nemolite",
"Quadratus",
"Actinium",
"Cryotic",
"Solarite",
"Zefendium",
"Alternium",
"Lanthanite",
"Vortennial",
"Unobtainium",
"SFoRE",
"Nocturnite",
"WOOD GRAIN",
"Legacy Dyronsinite",
"Newtonium",
"Hyperstone",
"Chromatite",

--Exotic
"Phobetor",
"Voidflower",
"Aurantial",
"Neutronium",
"Crystal Oculite",
"Coronium",
"Accretite",
"Entiniol",
"Arctine",
"Matterium",
"Legacy Coronium",
"Legacy Neptunium",
"Legacy Pulsar Crystal",
"Snowglobe",
"Elexinite",
"Inktite",
"Thundarian",
"Exolite",
"Lutetium",
"Aegistone",
"Freon",
"Poiseon",
"Flaeon",
"Legacy Freon",
"Legacy Flaeon",
"Legacy Poiseon",
"Legacy Halcyon Emission",
"Scertanium",
"Accretium",
"Astatine",
"Snoblintium",
"Christmasalis",
"Neptunium",
"WATERMELON ORE",
"Combustal",
"Rosarium",
"Temporum",
"Blazuine",
"BANANORE",
"Agoraphore",
"Legacy Codex",

--Exquisite
"Kaleidium",
"Cosmic Treasure",
"Circeterra",
"Torilite",
"Revenite",
"Hexagelite",
"Laivertine",
"Atomium",
"Surgium",
"Protoflare",
"Noctilucite",
"Acceleratium",
"COCONUT ORE",
"Sagittarius Quasar",
"Vitrilyx",
"Ornalium",
"Legacy Malachite",
"Valentinyl",
"Estrela",
"Festivian",
"Legacy Astatine",
"Euclideum",

--Transcendent
"Andromidium",
"Magicis Floreat",
"NOO S-Sing. T1",
"Rigel",
"Galactic Rupture",
"Icarus",
"Spiritian",
"Twilight Mist",
"Unsteady Filaments",
"Catastormite",
"Contravexium",
"Coselnix",
"Heart of The Frosted",
"Plasmonium",
"Stazenium",
"Bathophobia",
"Vantivium",
"Legacy Andromidium",
"Altovite",
"R136a1",
"Legacy Lawrencium",
"Ascended Flare",
"Legacy Gargantium",
"Vaporwave Pulsar",
"the unfunny",
"waffle crystal",
"Suncindium",
"Pasivium",
"Spristium",
"North Star",
"Aether",
"Lovessence",
"Cleopatrite",
"Vulkavium",
"Plasmitan",
"Orb of Discontent",
"Legacy Neomandelite",
"Scarfyte",
"Azuryl",
"Xynarium",
"Speatrium",
"Quandrium",
"Behemoth Snowflake",
"CHICKEN Crystal",
"Panselinos",
"Soundstrocity",
"Sentimentium",
"Glacielle",
"Trinitium",
"Legacy Trinitium",
"Luminatite",
"Sentient Viscera",
"Erodimium",
"Illuminyx",
"Puppet Master",
"Exoretic",
"Σ",
"the funny",
"Dynafrost",
"Lucidium",
"Pastelorium",
"Albinite",
"Legacy Aurora",

--Enigmatic
"Auroral Singularity",
"Obliveracy Endmost",
"Coronal Flare",
"Gravitaticor",
"Verdulite",
"Unearthly Cubes",
"Neomandelite",
"Vitriol",
"Placongela",
"Frostrainium",
"Continuum Rift",
"Hyperheated Quasar",
"π",
"Accesinite",
"Genuinium",
"Fire Crystal",
"Pandorite",
"Legacy HR 5171 A",
"Oganesson",
"Legacy Coronal Flare",
"Aurora Polaris",
"HD 160529",
"Cerlustrium",
"Legacy Ω",
"Polarium",
"SHOWER CRYSTAL",
"Legacy Quasar V",
"Cybernetium",
"Surrenial",
"Elementium",
"tycoon crystal",
"Garlic bread crystal",
"Noxilenciosa",
"Verdilute",
"Legacy Aether",
"Thalassus",
"Inkonium",
"Flare of Trascendence",
"Dyronsinite",
"Legacy Vitriol",
"RGB Pulsar",
"Gargantium",
"Magnetyx",
"Ω",
"Phantomalgamation",
"Candilium",
"Elbrus' Pride",
"Vaporwave Crystal",
"The North Pole",

--Unfathomable
"NOO P α",
"Acrimony",
"Caelarius",
"The Cylinder",
"Exdeus",
"Laniakea Supercluster",
"a flare v2",
"Idolium",
"Frostblossom",
"Scribbal",
"Terratomere",
"Endozivite",
"Armageddium",
"Inclemetite",
"Illusory Bubblegram",
"Corrodine Pulsar",
"Nyctophyte",
"Legacy Quasar 618",
"Quasar 618",
"Legacy Voidirinite",
"Dynamo of Fate",

--Otherworldy
"Machina",
"NILNAL",
"Chrysalis",
"Retina",
"Epinephrine",

--Zenith
"Zanarchium",
"Paste Crystal"


}) do
    WhiteList[oreName] = true
end

local function handleChildAddition(child)
    task.spawn(function()
        local remoteEvent = ReplicatedStorage:FindFirstChild("PinglessMine")
        if remoteEvent then
            remoteEvent:FireServer(child, child.Position)
            task.wait(0.07)
        end
    end)
end

local connection = Mine.ChildAdded:Connect(handleChildAddition)

local function minerares()
   print("Checking for rare ores")
   for _, v in pairs(workspace.Mine:GetChildren()) do
       if WhiteList[v.Name] == true then
           print("Found ore: " .. v.Name)
           ReplicatedStorage.PinglessMine:FireServer(v, v.Position)
           task.wait(0.2)
       end
   end
end

local function TPlayer()
    local y = player.Character.HumanoidRootPart.CFrame.Position.Y
    if y > 10000 and ReplicatedStorage.CurCapacity.Value < 12000 and orewanted ~= "Stone" then
        ReplicatedStorage.GenerateTP:FireServer(layernumber)
    elseif y > 10000 and ReplicatedStorage.CurCapacity.Value < 12000 and orewanted == "Stone" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-260.776, 10005.997, 144.385)
    elseif y > 10000 and ReplicatedStorage.CurCapacity.Value < 12000 and orewanted == "Slate" then
        
    end
end

local function MoveForward()
    character.Humanoid:MoveTo(character.HumanoidRootPart.Position+character.HumanoidRootPart.CFrame.lookVector*studs)
end

local function minecheck()
    print("Check Mining Status")
    local minebefore = player.leaderstats.Mined.Value
    wait(3)
    
    local maxAttempts = 100
    local attempts = 0

    if player.leaderstats.Mined.Value == minebefore then
        print("Mining Stopped, Resuming")
        
        while attempts < maxAttempts do
            local absmax = -math.huge  -- set to a very low value so any other value will be greater
            local maxore = nil
            
            for _, v in pairs(Mine:GetChildren()) do
                if math.abs(v.Position.Z) > absmax then
                    absmax = math.abs(v.Position.Z)
                    maxore = v
                end
            end
            ReplicatedStorage.PinglessMine:FireServer(maxore, maxore.Position)
            attempts = attempts + 1
            task.wait(0.1)
        end
    end
end
local function capCheck()
    if ReplicatedStorage.CurCapacity.Value >= 115000 then
        isRunning = false
        connection:Disconnect()  -- Disconnect the existing connection
        task.wait(40)
        isRunning = true 
        connection = Mine.ChildAdded:Connect(handleChildAddition) -- Reconnect the connection
    end
end 

local lastTeleportCheck = tick()
local lastMiningCheck = tick()

local function teleportLoop()
    local currentTime = tick()
    if currentTime - lastTeleportCheck >= TELEPORT_CHECK_INTERVAL and isRunning and not isMoon then
        print("Checking if player is in correct layer")
        TPlayer()
        lastTeleportCheck = currentTime
    end
end

local function miningloop()
    local currentTime = tick()
    if currentTime - lastMiningCheck >= MINING_CHECK_INTERVAL and isRunning then
        coroutine.wrap(minerares)()
        coroutine.wrap(minecheck)()
        lastMiningCheck = currentTime
    end
end

local function MoveForwardLoop()
    while wait(0.1) do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150
    local y = player.Character.HumanoidRootPart.CFrame.Position.Y
        if isRunning and y < 10000 then
            MoveForward()
        end
    end
end
    
local function capCheckLoop()
    while wait(1) do
        capCheck()
    end
end

RunService.Heartbeat:Connect(teleportLoop)
RunService.Heartbeat:Connect(miningloop)
coroutine.wrap(capCheckLoop)()
coroutine.wrap(MoveForwardLoop)()

	

-- Disconnect the ChildAdded event when the script ends or the player leaves.
game:GetService("Players").PlayerRemoving:Connect(function(plr)
    if plr == player then
        connection:Disconnect()
    end
end)

--settings for later use
--Stone(75)
--Basalt(1075)
--Granite(2075)
--Diorite(3075)
--Obsidian(4075)
--Marble(5075)
--Mantle(6075)
--Magma (Core) (7075)

--Slate(75)
--Permafrost(1075)
--Shatterstone(2075)
--Riftrock(3075)
--Darkmatter(4075)
--Void(5075)