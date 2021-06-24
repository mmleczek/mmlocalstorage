fx_version "bodacious"
game "gta5"
lua54 "yes"

author "mmleczek (mmleczek.pl)"
description "local data managment system"
version "1.0.0"

ui_page "ui.html"

files {
	"ui.html"
}

client_script "client.lua"

exports {
	"Get",
	"GetSync",
	"Set",
	"Remove"
}