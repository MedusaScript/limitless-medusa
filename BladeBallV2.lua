-- Pastikan UI Library diinstal dengan baik, contoh menggunakan library Roblox
local uiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Membuat Jendela UI dengan Judul "BrutalityV2"
local window = uiLibrary.CreateLib("BrutalityV2 - YourRobloxUsername", "DarkTheme")

-- Variabel untuk Melacak Status Parry dan Jendela UI
local isParrying = false
local isWindowVisible = true

-- Fungsi untuk Memulai Auto Parry
local function startParry()
    isParrying = true
    -- Masukkan logika parry otomatis di sini
    while isParrying do
        -- Logika Parry Otomatis
        print("Parry terjadi!")
        wait(0.1) -- Set interval untuk parry
    end
end

-- Fungsi untuk Menghentikan Auto Parry
local function stopParry()
    isParrying = false
    -- Berhentikan logika parry otomatis di sini
    print("Auto Parry Dihentikan")
end

-- Fungsi untuk Menampilkan atau Menyembunyikan Jendela UI
local function toggleWindow()
    isWindowVisible = not isWindowVisible
    window:Toggle(isWindowVisible)
    if isWindowVisible then
        print("Jendela UI Dibuka")
    else
        print("Jendela UI Ditutup")
    end
end

-- Fungsi untuk membuat UI draggable
local function makeDraggable(frame)
    local UIS = game:GetService("UserInputService")
    local dragToggle, dragStart, startPos

    local function updateInput(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = false
        end
