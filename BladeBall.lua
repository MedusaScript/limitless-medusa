-- Cek apakah URL Library UI dapat diakses
local success, uiLibrary = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
end)

if not success then
    print("Gagal memuat UI Library. Pastikan URL benar dan dapat diakses.")
    return
end
print("UI Library berhasil dimuat.")

-- Membuat Jendela UI dengan Judul "BrutalityV2"
local window = uiLibrary.CreateLib("BrutalityV2 - YourRobloxUsername", "DarkTheme")

-- Variabel untuk Melacak Status Parry dan Jendela UI
local isParrying = false
local isWindowVisible = true

-- Fungsi untuk Memulai Auto Parry
local function startParry()
isParrying = true
print("Auto Parry Dimulai")
while isParrying do
-- Logika Parry Otomatis
print("Parry terjadi!")
wait(0.1) -- Set interval untuk parry
end
end

-- Fungsi untuk Menghentikan Auto Parry
local function stopParry()
isParrying = false
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
end)

UIS.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement and dragToggle then
updateInput(input)
end
end)
end

-- Membuat Tab Utama dan Bagian Skrip
local mainTab = window:NewTab("Main")
local mainSection = mainTab:NewSection("Auto Parry")

-- Menambahkan Tombol "Mulai" pada UI
mainSection:NewButton("Mulai Auto Parry", "Aktifkan Auto Parry", function()
startParry()
end)

-- Menambahkan Tombol "Berhenti" pada UI
mainSection:NewButton("Berhenti Auto Parry", "Nonaktifkan Auto Parry", function()
stopParry()
end)

-- Menambahkan Tombol "Tutup Jendela UI" pada UI
mainSection:NewButton("Tutup Jendela UI", "Sembunyikan Jendela User Interface", function()
toggleWindow()
end)

-- Menambahkan Tombol "Hapus Skrip" pada UI
mainSection:NewButton("Hapus Skrip", "Menghapus Skrip dari Memori", function()
stopParry()
window:Destroy()
print("Skrip Dihapus")
end)

-- Tambahkan fungsi draggable ke window
makeDraggable(window)

-- Menambahkan Notifikasi untuk Bergabung dengan Discord
print("Bergabunglah dengan komunitas kami di Discord: https://discord.gg/medusascript")

-- Perlindungan tambahan
if not game:IsLoaded() then
game.Loaded:Wait()
end

local protect = {} -- Membuat tabel kosong untuk perlindungan
protect.__index = protect -- Mengatur metatable untuk tabel perlindungan

-- Fungsi untuk memeriksa lingkungan dan skrip ilegal
function protect:checkEnvironment()
if getgenv then
setfenv(1, protect)
else
error("Lingkungan tidak didukung!")
end
end

-- Menjalankan perlindungan lingkungan
protect:checkEnvironment()

-- Menambahkan Fungsi anti-detection
local function antiDetection()
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
local args = {...}
local method = getnamecallmethod()

if method == "Kick" then
return nil
end

return oldNamecall(self, unpack(args))
end)

setreadonly(mt, true)
end

-- Mengaktifkan perlindungan anti-detection
antiDetection()
[]