-- Skid = Mati Nya Ga Di Terima Sama Maha Kuasa
local SlayerzUI_MobileToggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/SlayerzUI/main/MBToggle.script"))()
SlayerzUI_MobileToggle:Create("rbxassetid://16058297648") -- Inget Tuh Tai
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
print("Auto Parry Dimulai")
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
-- Hapus semua event dan callback
stopParry()
window:Destroy()
print("Skrip Dihapus")
end)

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

-- Menambahkan fungis anti-detection
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
