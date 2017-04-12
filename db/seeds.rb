# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.

#FIXME i18n title
Content.delete_all
Content.create!(id: 1, title: "Фоновая музыка")
Content.create!(id: 2, title: "Аудио-реклама")
Content.create!(id: 3, title: "Фоновое видео")
Content.create!(id: 4, title: "Видео-реклама")
Content.create!(id: 5, title: "Фоновые изображения")
Content.create!(id: 6, title: "Рекламные изображения")

#FIXME need i18n "minutes"
Period.delete_all

Period.create!(id: 1, value: 1, name: "60 минут")
Period.create!(id: 2, value: 2, name: "30 минут")
Period.create!(id: 3, value: 3, name: "20 минут")
Period.create!(id: 4, value: 4, name: "15 минут")
Period.create!(id: 5, value: 6, name: "10 минут")
Period.create!(id: 6, value: 12, name: "5 минут")
Period.create!(id: 7, value: 15, name: "4 минуты")

Status.delete_all

Status.create!(id: 1, name: "New")
Status.create!(id: 2, name: "Play")
Status.create!(id: 3, name: "Cancel")

#FIXME need render with warnings, errors
Typeofstatus.delete_all

Typeofstatus.create!(id: 1, name: "WAIT", priority: 1)
Typeofstatus.create!(id: 2, name: "RECEIVED", priority: 2)
Typeofstatus.create!(id: 3, name: "PROGRESS", priority: 3)
Typeofstatus.create!(id: 4, name: "COMPLETED", priority: 4)
Typeofstatus.create!(id: 5, name: "CANCEL", priority: 5)

Typeoftask.delete_all

Typeoftask.create!(id: 1, name: "DOWNLOADS", priority: "2")
Typeoftask.create!(id: 2, name: "PLAYLIST.MUSIC", priority: "3")
Typeoftask.create!(id: 3, name: "SETVOL", priority: "1")
Typeoftask.create!(id: 4, name: "SYNC.TIME", priority: "4")
Typeoftask.create!(id: 5, name: "SETINTERVAL", priority: "5")
Typeoftask.create!(id: 6, name: "SETEQU", priority: "6")
Typeoftask.create!(id: 7, name: "GETVER", priority: "7")
Typeoftask.create!(id: 8, name: "CMD.FOUR", priority: "8")
Typeoftask.create!(id: 9, name: "CMD.FIVE", priority: "9")
Typeoftask.create!(id: 10, name: "CMD.TWO", priority: "10")
Typeoftask.create!(id: 11, name: "CMD.ONE", priority: "11")
Typeoftask.create!(id: 12, name: "SET.VOLSOFDAY", priority: "12")
Typeoftask.create!(id: 13, name: "WORKTIME", priority: "13")
Typeoftask.create!(id: 14, name: "PLAYLIST.BGMUSIC", priority: "14")
Typeoftask.create!(id: 15, name: "UPDATE", priority: "15")
Typeoftask.create!(id: 16, name: "CMD.SIX", priority: "16")
Typeoftask.create!(id: 17, name: "DEL.ALL", priority: "17")
Typeoftask.create!(id: 18, name: "PLAYLIST.BGVIDEO", priority: "18")
Typeoftask.create!(id: 19, name: "PLAYLIST.BGIMAGE", priority: "19")
Typeoftask.create!(id: 20, name: "JINJLES", priority: "20")
Typeoftask.create!(id: 21, name: "NEWID", priority: "21")
Typeoftask.create!(id: 22, name: "SENDWAVE", priority: "22")
Typeoftask.create!(id: 23, name: "SENDPLSOFDAY", priority: "23")
Typeoftask.create!(id: 24, name: "DEL.TASK", priority: "24")
Typeoftask.create!(id: 25, name: "CHGPWD", priority: "25")
Typeoftask.create!(id: 26, name: "MUTEOFF", priority: "26")
Typeoftask.create!(id: 27, name: "FWEIGHT", priority: "27")
Typeoftask.create!(id: 28, name: "CFWEIGHT", priority: "28")
Typeoftask.create!(id: 29, name: "SLEEP", priority: "29")
Typeoftask.create!(id: 30, name: "IMAGEGET", priority: "30")
Typeoftask.create!(id: 31, name: "IMAGEVIEW", priority: "31")
Typeoftask.create!(id: 32, name: "EXTDOWNLOADS", priority: "32")
Typeoftask.create!(id: 33, name: "DEL.FILES", priority: "33")
Typeoftask.create!(id: 34, name: "SET.FILES.WEIGHT", priority: "34")
Typeoftask.create!(id: 35, name: "CHG.FILES.WEIGHT", priority: "35")
Typeoftask.create!(id: 36, name: "SEND.BGPLS", priority: "36")
Typeoftask.create!(id: 37, name: "SEND.ADPLS", priority: "37")

