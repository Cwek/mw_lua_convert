local Convect_Date={
	["value"]={["length"]={},["area"]={},["volume"]={},["speed"]={},["force"]={},["energy"]={},["temperature"]={},["mass"]={},["torque"]={}},
	["display"]={["length"]={},["area"]={},["volume"]={},["speed"]={},["force"]={},["energy"]={},["temperature"]={},["mass"]={},["torque"]={}},
	["link"]={["length"]={},["area"]={},["volume"]={},["speed"]={},["force"]={},["energy"]={},["temperature"]={},["mass"]={},["torque"]={}}
}
 
--[[
    转换值
    长度，基准为m
--]]
Convect_Date.value.length={
                            --国际单位制
                            ["m"]=1,
                            ["Mm"]=1000000,
                            ["km"]=1000,
                            ["cm"]=0.01,
                            ["mm"]=0.001,
                            ["um"]=0.000001,
                            ["nm"]=0.000000001,
                            --非国际单位制
                            ["angstrom"]=0.0000000001,
                            --英制和美国常用
                            ["mi"]=1609.344,
                            ["furlong"]=201.168,
                            ["chain"]=20.1168,
                            ["rd"]=5.0292,
                            ["fathom"]=1.8288,
                            ["yd"]=0.9144,
                            ["foot"]=0.3048,
                            ["in"]=0.0254,
                            --其他
                            ["nmi"]=1852,
                            ["pc"]=3.0856775814672e16,
                            ["ly"]=9.4607304725808e15,
                            ["AU"]=149597870700
                            }
Convect_Date.value.length["μm"]=Convect_Date.value.length["um"]
Convect_Date.value.length["Å"]=Convect_Date.value.length["angstrom"]
Convect_Date.value.length["ft"]=Convect_Date.value.length["foot"]
 
--面积，基准为m2
Convect_Date.value.area={
                          --国际单位制
                          ["m2"]=1,
                          ["km2"]=1000000,
                          ["cm2"]=0.0001,
                          ["mm2"]=0.000001,
                          --非国际单位制
                          ["ha"]=10000,
                          --市制
                          ["mu"]=((2/3)*1000),
                          --英制和美国常用
                          ["sqmi"]=2589988.110336,
                          ["acre"]=4046.856422,
                          ["sqyd"]=0.83612736,
                          ["sqfoot"]=0.09290304,
                          ["sqin"]=0.00064516,
                          --其他
                          ["sqnmi"]=3429904,
                          ["dunam"]=1000,
                          ["tsubo"]=(400/121)
                         }
Convect_Date.value.area["sqft"]=Convect_Date.value.area["sqfoot"]
 
--体积，基准为m3
Convect_Date.value.volume={
                            --国际单位制
                            ["m3"]=1,
                            ["cm3"]=0.000001,
                            ["mm3"]=0.000000001,
                            --非国际单位制
                            ["kl"]=1,
                            ["l"]=0.001,
                            ["cl"]=0.00001,
                            ["ml"]=0.000001,
                            --英制和美国常用
                            ["cuyd"]=0.764554857984,
                            ["cufoot"]=0.028316846592,
                            ["cuin"]=0.000016387064,
                            --英制
                            ["impbbl"]=0.16365924,
                            ["impbsh"]=0.03636872,
                            ["impgal"]=0.00454609,
                            ["impqt"]=0.0011365225,
                            ["imppt"]=0.00056826125,
                            ["impoz"]=0.0000284130625,
                            --美国常用液体计量
                            ["USbbl"]=0.119240471196,
                            ["oilbbl"]=0.158987294928,
                            ["USbeerbbl"]=0.117347765304,
                            ["USgal"]=0.003785411784,
                            ["USqt"]=0.000946352946,
                            ["USpt"]=0.000473176473,
                            ["USoz"]=0.0000295735295625,
                            --美国常用固体计量
                            ["USdrybbl"]=0.11562819898508,
                            ["USbsh"]=0.03523907016688,
                            ["USbu"]=0.03523907016688,
                            ["USdrygal"]=0.00440488377086,
                            ["USdryqt"]=0.001101220942715,
                            ["USdrypt"]=0.0005506104713575
                            }
Convect_Date.value.volume["cc"]=Convect_Date.value.volume["cm3"]
Convect_Date.value.volume["kL"]=Convect_Date.value.volume["kl"]
Convect_Date.value.volume["L"]=Convect_Date.value.volume["l"]
Convect_Date.value.volume["cL"]=Convect_Date.value.volume["cl"]
Convect_Date.value.volume["mL"]=Convect_Date.value.volume["ml"]
Convect_Date.value.volume["cuft"]=Convect_Date.value.volume["cufoot"]
Convect_Date.value.volume["impbu"]=Convect_Date.value.volume["impbsh"]
Convect_Date.value.volume["impfloz"]=Convect_Date.value.volume["impoz"]
Convect_Date.value.volume["U.S.bbl"]=Convect_Date.value.volume["USbbl"]
Convect_Date.value.volume["usbeerbbl"]=Convect_Date.value.volume["USbeerbbl"]
Convect_Date.value.volume["U.S.beerbbl"]=Convect_Date.value.volume["USbeerbbl"]
Convect_Date.value.volume["U.S.gal"]=Convect_Date.value.volume["USgal"]
Convect_Date.value.volume["U.S.qt"]=Convect_Date.value.volume["USqt"]
Convect_Date.value.volume["U.S.pt"]=Convect_Date.value.volume["USpt"]
Convect_Date.value.volume["USfloz"]=Convect_Date.value.volume["USoz"]
Convect_Date.value.volume["U.S.oz"]=Convect_Date.value.volume["USoz"]
Convect_Date.value.volume["U.S.floz"]=Convect_Date.value.volume["USoz"]
Convect_Date.value.volume["U.S.drybbl"]=Convect_Date.value.volume["USdrybbl"]
Convect_Date.value.volume["U.S.bsh"]=Convect_Date.value.volume["USbsh"]
Convect_Date.value.volume["U.S.bu"]=Convect_Date.value.volume["USbu"]
Convect_Date.value.volume["U.S.drygal"]=Convect_Date.value.volume["USdrygal"]
Convect_Date.value.volume["U.S.dryqt"]=Convect_Date.value.volume["USdryqt"]
Convect_Date.value.volume["U.S.drypt"]=Convect_Date.value.volume["USdrypt"]
 
--速度，基准为m/s
Convect_Date.value.speed={
                           --国际单位制
                           ["m/s"]=1,
                           --非国际单位制
                           ["km/h"]=(5/18),
                           --英制和美国常用
                           ["mph"]=0.44704,
                           ["ft/s"]=0.3048,
                           --海事单位
                           ["knot"]=(4.63/9)
                           }
Convect_Date.value.speed["foot/s"]=Convect_Date.value.speed["ft/s"]
Convect_Date.value.speed["kn"]=Convect_Date.value.speed["knot"]
 
--力，基准为N
Convect_Date.value.force={
                           --国际单位制
                           ["N"]=1,
                           ["GN"]=1000000000,
                           ["MN"]=1000000,
                           ["kN"]=1000,
                           ["mN"]=0.001,
                           ["uN"]=0.000001,
                           ["nN"]=0.000000001,
                           --厘米-克-秒
                           ["Mdyn"]=10,
                           ["kdyn"]=0.01,
                           ["dyn"]=0.00001,
                           ["mdyn"]=0.00000001,
                           --公制重力单位
                           ["t-f"]=9806.65,
                           ["kg-f"]=9.80665,
                           ["g-f"]=0.00980665,
                           ["mg-f"]=0.00000980665,
                           --常衡基础单位
                           ["pdl"]=0.138254954376,
                           ["LT-f"]=9964.01641818352,
                           ["ST-f"]=8896.443230521,
                           ["lb-f"]=4.4482216152605,
                           ["gr-f"]=0.0006354602307515
                          }
Convect_Date.value.force["μN"]=Convect_Date.value.force["uN"]
Convect_Date.value.force["dyne"]=Convect_Date.value.force["dyn"]
Convect_Date.value.force["tf"]=Convect_Date.value.force["t-f"]
Convect_Date.value.force["kgf"]=Convect_Date.value.force["kg-f"]
Convect_Date.value.force["gf"]=Convect_Date.value.force["g-f"]
Convect_Date.value.force["mgf"]=Convect_Date.value.force["mg-f"]
Convect_Date.value.force["LTf"]=Convect_Date.value.force["LT-f"]
Convect_Date.value.force["STf"]=Convect_Date.value.force["ST-f"]
Convect_Date.value.force["lbf"]=Convect_Date.value.force["lb-f"]
Convect_Date.value.force["grf"]=Convect_Date.value.force["gr-f"]
 
--能量，基准为J
Convect_Date.value.energy={
                           --国际单位制
                           ["J"]=1,
                           ["GJ"]=1000000000,
                           ["MJ"]=1000000 ,
                           ["kj"]=1000,
                           ["hj"]=100,
                           ["daj"]=10,
                           ["dj"]=0.1,
                           ["mj"]=0.01,
                           ["cj"]=0.001,
                           ["uj"]=0.000001,
                           ["nj"]=0.000000001,
                           --厘米-克-秒
                           ["Merg"]=0.1,
                           ["kerg"]=0.0001,
                           ["erg"]=0.0000001,
                           --瓦特时复合
                           ["TWh"]=3.6e15,
                           ["GWh"]=3.6e12,
                           ["MWh"]=3600000000,
                           ["kWh"]=3600000,
                           ["Wh"]=3600,
                           --电子伏特
                           ["GeV"]=0.0000000001602176487,
                           ["MeV"]=1.602176487e-13,
                           ["keV"]=1.602176487e-16,
                           ["eV"]=1.602176487e-19,
                           ["meV"]=1.602176487e-22,
                           --卡路里复合
                           ["Cal"]=4184,
                           ["Mcal"]=4814000,
                           ["kcal"]=4184,
                           ["cal"]=4.184,
                           ["mcal"]=0.004814,
                           --磅/力/-英寸/英寸-时-分-秒
                           ["ftpdl"]=0.0421401100938048,
                           ["ftlbf"]=1.3558179483314004,
                           ["inlbf"]=0.1129848290276167,
                           ["inozf"]=0.00706155181422604375,
                           ["hph"]=2684519.537696172792,
                           --英热单位
                           ["Btu"]=1,055.05585262,
                           --爆炸当量系列单位
                           ["GtTNT"]=4.1840e18,
                           ["MtTNT"]=4.184e15,
                           ["ktTNT"]=4.184e12,
                           ["tTNT"]=4184000000,
                           --其他
                           ["Eh"]=4.35974417e-18,
                           ["Ry"]=2.1798741e-18,
                           ["toe"]=41868000000,
                           ["BOE"]=6117863200,
                           ["cuftnaturalgas"]=1055055.85262,
                           ["latm"]=101.325,
                           ["impgalatm"]=460.63256925,
                           ["USgalatm"]=383.5568490138
                           }
Convect_Date.value.energy["μJ"]=Convect_Date.value.energy["uj"]
Convect_Date.value.energy["TW.h"]=Convect_Date.value.energy["TWh"]
Convect_Date.value.energy["GW.h"]=Convect_Date.value.energy["GWh"]
Convect_Date.value.energy["MW.h"]=Convect_Date.value.energy["MWh"]
Convect_Date.value.energy["kW.h"]=Convect_Date.value.energy["kWh"]
Convect_Date.value.energy["W.h"]=Convect_Date.value.energy["Wh"]
Convect_Date.value.energy["ftlb-f"]=Convect_Date.value.energy["ftlbf"]
Convect_Date.value.energy["inbl-f"]=Convect_Date.value.energy["inlbf"]
Convect_Date.value.energy["inoz-f"]=Convect_Date.value.energy["inozf"]
Convect_Date.value.energy["BTU"]=Convect_Date.value.energy["Btu"]
Convect_Date.value.energy["GtonTNT"]=Convect_Date.value.energy["GtTNT"]
Convect_Date.value.energy["MtonTNT"]=Convect_Date.value.energy["MtTNT"]
Convect_Date.value.energy["ktonTNT"]=Convect_Date.value.energy["ktTNT"]
Convect_Date.value.energy["tonTNT"]=Convect_Date.value.energy["tTNT"]
Convect_Date.value.energy["cufootnaturalgas"]=Convect_Date.value.energy["cuftnaturalgas"]
Convect_Date.value.energy["Latm"]=Convect_Date.value.energy["latm"]
Convect_Date.value.energy["usgalatm"]=Convect_Date.value.energy["USgalatm"]
Convect_Date.value.energy["U.S.galatm"]=Convect_Date.value.energy["USgalatm"]


--[[ 
--温度，基准为K
Convect_Date.value.temperature={
                                 --国际单位制
                                 ["K"]={function(input) return 1*input end,function(input) return 1*input end},
                                 ["C"]={function(input) return (input+273.15) end ,function(input) return input-273.15 end},
                                 --英制和美国常用
                                 ["R"]={function(input) return (input/1.8) end,function(input) return input*1.8 end},
                                 ["F"]={function(input) return ((input+459.67)/1.8) end,function(input) return input*1.8-459.67 end}
                                 }
Convect_Date.value.temperature["°C"]=Convect_Date.value.temperature["C"]
Convect_Date.value.temperature["°R"]=Convect_Date.value.temperature["R"]
Convect_Date.value.temperature["°F"]=Convect_Date.value.temperature["F"]

--由于mw.loadData()不允许返回表及子表存在函数，所以移入main.lua
--]]


--质量，基准为kg
Convect_Date.value.mass={
                          --国际单位制
                          ["kg"]=1,
                          ["g"]=0.001,
                          ["mg"]=0.000001,
                          ["ug"]=0.000000001,
                          --非国际单位制
                          ["t"]=1000,
                          --常衡
                          ["LT"]=1016.0469088,
                          ["ST"]=907.18474,
                          ["st"]=6.35029318,
                          ["lb"]=0.45359237,
                          ["oz"]=0.028349523,
                          ["drachm"]=0.001771845195,
                          ["gr"]=0.00006479891,
                          --金衡
                          ["ozt"]=0.0311034768,
                          --其他
                          ["carat"]=0.0002
                         }
Convect_Date.value.mass["μg"]=Convect_Date.value.mass["ug"]
Convect_Date.value.mass["MT"]=Convect_Date.value.mass["t"]
Convect_Date.value.mass["long ton"]=Convect_Date.value.mass["LT"]
Convect_Date.value.mass["short ton"]=Convect_Date.value.mass["ST"]
Convect_Date.value.mass["dram"]=Convect_Date.value.mass["drachm"]
 
--力矩，基准为Nm
Convect_Date.value.torque={
                            --国际单位制
                            ["Nm"]=1,
                            --非国际单位制
                            ["kgm"]=9.80665,
                            --英制和美国常用
                            ["ftlb"]=1.3558179483314004
                           }
Convect_Date.value.torque["kgf.m"]=Convect_Date.value.torque["kgm"]
Convect_Date.value.torque["lbfft"]=Convect_Date.value.torque["ftlb"]
 
--[[
    显示值（中文名，缩写名or符号）
--]]
--长度
Convect_Date.display.length={
                                --国际单位制
                                ["m"]={"米","m"},
                                ["Mm"]={"兆米","Mm"},
                                ["km"]={"千米","km"},
                                ["cm"]={"厘米","cm"},
                                ["mm"]={"毫米","mm"},
                                ["um"]={"微米","μm"},
                                ["nm"]={"纳米","nm"},
                                --非国际单位制
                                ["angstrom"]={"埃","?"},
                                --英制和美国常用
                                ["mi"]={"英里","英里"},
                                ["furlong"]={"浪",nil},
                                ["chain"]={"链",nil},
                                ["rd"]={"棒","rd"},
                                ["fathom"]={"英寻",nil},
                                ["yd"]={"码","yd"},
                                ["ft"]={"英尺","ft"},
                                ["in"]={"英寸","in"},
                                --其他
                                ["nmi"]={"海里","nmi"},
                                ["pc"]={"秒差距","pc"},
                                ["ly"]={"光年","ly"},
                                ["AU"]={"天文单位","AU"},
                             }
Convect_Date.display.length["μm"]=Convect_Date.display.length["um"]
Convect_Date.display.length["Å"]=Convect_Date.display.length["angstrom"]
Convect_Date.display.length["foot"]=Convect_Date.display.length["ft"]
    Convect_Date.display.length["foot"][2]="foot"
 
--面积
Convect_Date.display.area={
                              --国际单位制
                              ["m2"]={"平方米","m<sup>2</sup>"},
                              ["km2"]={"平方千米","km<sup>2</sup>"},
                              ["cm2"]={"平方厘米","cm<sup>2</sup>"},
                              ["mm2"]={"平方毫米","mm<sup>2</sup>"},
                              --非国际单位制
                              ["ha"]={"公顷","ha"},
                              --市制
                              ["mu"]={"亩","mu"},
                              --英制和美国常用
                              ["sqmi"]={"平方英里","平方英里"},
                              ["acre"]={"英亩",nil},
                              ["sqyd"]={"平方码","sq yd"},
                              ["sqft"]={"平方英尺","sq ft"},
                              ["sqin"]={"平方英寸","sq in"},
                              --其他
                              ["sqnmi"]={"平方海里","sq nmi"},
                              ["dunam"]={"德南",nil},
                              ["tsubo"]={"坪",nil}
                           }
Convect_Date.display.area["sqfoot"]=Convect_Date.display.area["sqft"]
    Convect_Date.display.area["sqfoot"][2]="square foot"
--体积
Convect_Date.display.volume={
                                --国际单位制
                                ["m3"]={"立方米","m<sup>3</sup>"},
                                ["cm3"]={"立方厘米","cm<sup>3</sup>"},
                                ["mm3"]={"立方毫米","mm<sup>3</sup>"},
                                --非国际单位制
                                ["kl"]={"千升","kL"},
                                ["l"]={"升","L"},
                                ["cl"]={"厘升","cL"},
                                ["ml"]={"毫升","mL"},
                                --英制和美国常用
                                ["cuyd"]={"立方码","cu yd"},
                                ["cuft"]={"立方英尺","cu ft"},
                                ["cuin"]={"立方英寸","cu in"},
                                --英制
                                ["impbbl"]={"英制桶","imp bbl"},
                                ["impbsh"]={"英制蒲式耳","imp bsh"},
                                ["impgal"]={"英制加仑","imp gal"},
                                ["impqt"]={"英制夸脱","imp qt"},
                                ["imppt"]={"英制品脱","imp pt"},
                                ["impoz"]={"英制液体盎司","imp fl oz"},
                                --美国常用液体计量
                                ["USbbl"]={"美制桶","US bbl"},
                                ["oilbbl"]={"桶","bbl"},
                                ["USbeerbbl"]={"美制啤酒桶","US bbl"},
                                ["USgal"]={"美制加仑","US gal"},
                                ["USqt"]={"美制夸脱","US qt"},
                                ["USpt"]={"美制品脱","US pt"},
                                ["USoz"]={"美制液体盎司","US fl oz"},
                                --美国常用固体计量
                                ["USdrybbl"]={"美制干桶","US dry bbl"},
                                ["USbsh"]={"美制蒲式耳","US bsh"},
                                ["USbu"]={"美制蒲式耳","US bu"},
                                ["USdrygal"]={"美制干量加仑","US dry gal"},
                                ["USdryqt"]={"美制干量夸脱","US dry qt"},
                                ["USdrypt"]={"美制干量品脱","US dry pt"}
                             }
Convect_Date.display.volume["cc"]=Convect_Date.display.volume["cm3"]
 
Convect_Date.display.volume["kL"]=Convect_Date.display.volume["kl"]
    Convect_Date.display.volume["kL"][2]="kL"
 
Convect_Date.display.volume["L"]=Convect_Date.display.volume["l"]
    Convect_Date.display.volume["L"][2]="L"
 
Convect_Date.display.volume["cL"]=Convect_Date.display.volume["cl"]
    Convect_Date.display.volume["cL"][2]="cL"
 
Convect_Date.display.volume["mL"]=Convect_Date.display.volume["ml"]
    Convect_Date.display.volume["mL"][2]="mL"
 
Convect_Date.display.volume["cufoot"]=Convect_Date.display.volume["cuft"]
    Convect_Date.display.volume["cufoot"][2]="cubic foot"
 
Convect_Date.display.volume["impbu"]=Convect_Date.display.volume["impbsh"]
Convect_Date.display.volume["impfloz"]=Convect_Date.display.volume["impoz"]
 
Convect_Date.display.volume["U.S.bbl"]=Convect_Date.display.volume["USbbl"]
    Convect_Date.display.volume["U.S.bbl"][2]="U.S. bbl"
 
Convect_Date.display.volume["usbeerbbl"]=Convect_Date.display.volume["USbeerbbl"]
Convect_Date.display.volume["U.S.beerbbl"]=Convect_Date.display.volume["USbeerbbl"]
    Convect_Date.display.volume["U.S.beerbbl"][2]="U.S. bbl"
 
Convect_Date.display.volume["U.S.gal"]=Convect_Date.display.volume["USgal"]
    Convect_Date.display.volume["U.S.gal"][2]="U.S. gal"
 
Convect_Date.display.volume["U.S.qt"]=Convect_Date.display.volume["USqt"]
    Convect_Date.display.volume["U.S.qt"][2]="U.S. qt"
 
Convect_Date.display.volume["U.S.pt"]=Convect_Date.display.volume["USpt"]
    Convect_Date.display.volume["U.S.pt"][2]="U.S. pt"
 
Convect_Date.display.volume["USfloz"]=Convect_Date.display.volume["USoz"]
    Convect_Date.display.volume["USfloz"][2]="US fl oz"
 
Convect_Date.display.volume["U.S.oz"]=Convect_Date.display.volume["USoz"]
    Convect_Date.display.volume["U.S.oz"][2]="US fl oz"
 
Convect_Date.display.volume["U.S.floz"]=Convect_Date.display.volume["USoz"]
    Convect_Date.display.volume["U.S.floz"][2]="U.S. fl oz"
 
Convect_Date.display.volume["U.S.drybbl"]=Convect_Date.display.volume["USdrybbl"]
    Convect_Date.display.volume["U.S.drybbl"][2]="U.S. dry bbl"
 
Convect_Date.display.volume["U.S.bsh"]=Convect_Date.display.volume["USbsh"]
    Convect_Date.display.volume["U.S.bsh"][2]="U.S. bsh"
 
Convect_Date.display.volume["U.S.bu"]=Convect_Date.display.volume["USbu"]
    Convect_Date.display.volume["U.S.bu"][2]="U.S. bu"
 
Convect_Date.display.volume["U.S.drygal"]=Convect_Date.display.volume["USdrygal"]
    Convect_Date.display.volume["U.S.drygal"][2]="U.S. dry gal"
 
Convect_Date.display.volume["U.S.dryqt"]=Convect_Date.display.volume["USdryqt"]
    Convect_Date.display.volume["U.S.dryqt"][2]="U.S. dry qt"
 
Convect_Date.display.volume["U.S.drypt"]=Convect_Date.display.volume["USdrypt"]
    Convect_Date.display.volume["U.S.drypt"][2]="U.S. dry pt"
 
--速度
Convect_Date.display.speed={
                               --国际单位制
                               ["m/s"]={"米每秒","m/s"},
                               --非国际单位制
                               ["km/h"]={"千米每小时","km/s"},
                               --英制和美国常用
                               ["mph"]={"英里每小时","mph"},
                               ["ft/s"]={"英尺每秒","ft/s"},
                               --海事单位
                               ["knot"]={"节","kn"}
                            }
Convect_Date.display.speed["foot/s"]=Convect_Date.display.speed["ft/s"]
Convect_Date.display.speed["kn"]=Convect_Date.display.speed["knot"]
 
--力
Convect_Date.display.force={
                                --国际单位制
                                ["N"]={"牛顿","N"},
                                ["GN"]={"吉牛顿","GN"},
                                ["MN"]={"兆牛顿","NM"},
                                ["kN"]={"千牛顿","kN"},
                                ["mN"]={"毫牛顿","mN"},
                                ["uN"]={"微牛顿","μN"},
                                ["nN"]={"纳牛顿","nN"},
                                --厘米-克-秒
                                ["Mdyn"]={"兆达因","Mdyn"},
                                ["kdyn"]={"千达因","kdyn"},
                                ["dyn"]={"达因","dyn"},
                                ["mdyn"]={"毫达因","mdyn"},
                                --公制重力单位
                                ["t-f"]={"吨力","t<sub>f</sub>"},
                                ["kg-f"]={"千克力","kg<sub>f</sub>"},
                                ["g-f"]={"克力","g<sub>f</sub>"},
                                ["mg-f"]={"毫克力","mg<sub>f</sub>"},
                                --常衡基础单位
                                ["pdl"]={"磅达","pdl"},
                                ["LT-f"]={"长吨力","LT<sub>f</sub>"},
                                ["ST-f"]={"短吨力","ST<sub>f</sub>"},
                                ["lb-f"]={"磅力","lb<sub>f</sub>"},
                                ["gr-f"]={"格令力","gr<sub>f</sub>"}
                            }
Convect_Date.display.force["μN"]=Convect_Date.display.force["uN"]
Convect_Date.display.force["dyne"]=Convect_Date.display.force["dyn"]
Convect_Date.display.force["tf"]={"吨力","tf"}
Convect_Date.display.force["kgf"]={"千克力","kgf"}
Convect_Date.display.force["gf"]={"克力","gf"}
Convect_Date.display.force["mgf"]={"毫克力","mgf"}
Convect_Date.display.force["LTf"]={"长吨力","LTf"}
Convect_Date.display.force["STf"]={"短吨力","STf"}
Convect_Date.display.force["lbf"]={"磅力","lbf"}
Convect_Date.display.force["grf"]={"格令力","grf"}
 
--能量
Convect_Date.display.energy={
                                --国际单位制
                                ["J"]={"焦耳","J"},
                                ["GJ"]={"吉焦","GJ"},
                                ["MJ"]={"兆焦","MJ"},
                                ["kj"]={"千焦","kJ"},
                                ["hj"]={"百焦","hJ"},
                                ["daj"]={"十焦","daJ"},
                                ["dj"]={"分焦耳","dJ"},
                                ["mj"]={"毫焦耳","mJ"},
                                ["cj"]={"厘焦耳","cJ"},
                                ["uj"]={"微焦耳","μJ"},
                                ["nj"]={"纳焦耳","nJ"},
                                --厘米-克-秒
                                ["Merg"]={"兆尔格","Merg"},
                                ["kerg"]={"千尔格","kerg"},
                                ["erg"]={"尔格","erg"},
                                --瓦特时复合
                                ["TWh"]={"太瓦时","TWh"},
                                ["GWh"]={"吉瓦时","GWh"},
                                ["MWh"]={"兆瓦时","MWh"},
                                ["kWh"]={"千瓦时","kWh"},
                                ["Wh"]={"瓦时","Wh"},
                                --电子伏特
                                ["GeV"]={"吉电子伏","GeV"},
                                ["MeV"]={"兆电子伏","MeV"},
                                ["keV"]={"千电子伏","keV"},
                                ["eV"]={"电子伏特","eV"},
                                ["meV"]={"毫电子伏特","meV"},
                                --卡路里复合
                                ["Cal"]={"卡路里","Cal"},
                                ["Mcal"]={"兆卡","Mcal"},
                                ["kcal"]={"千卡","kcal"},
                                ["cal"]={"卡路里","cal"},
                                ["mcal"]={"毫卡","mcal"},
                                --磅/力/-英寸/英寸-时-分-秒
                                ["ftpdl"]={"英尺磅达","ft·pal"},
                                ["ftlbf"]={"英尺磅力","ft·lbf"},
                                ["inlbf"]={"英尺磅力","in·lbf"},
                                ["inozf"]={"英寸磅司力","in·ozf"},
                                ["hph"]={"马力小时","hp·h"},
                                --英热单位
                                ["Btu"]={"英热单位","Btu"},
                                --爆炸当量系列单位
                                ["GtTNT"]={"吉吨当量","GtTNT"},
                                ["MtTNT"]={"兆吨TNT当量","MtTNT"},
                                ["ktTNT"]={"千吨TNT当量","ktTNT"},
                                ["tTNT"]={"吨TNT当量","tTNT"},
                                --其他
                                ["Eh"]={"哈特里","''E''h"},
                                ["Ry"]={"里特伯","Ry"},
                                ["toe"]={"吨油当量","toe"},
                                ["BOE"]={"桶油当量","BOE"},
                                ["cuftnaturalgas"]={"立方英尺天然气当量",nil},
                                ["latm"]={"升-大气压","l·atm"},
                                ["impgalatm"]={"加仑-大气压","imp gal·atm"},
                                ["USgalatm"]={"美制加仑-大气压","US gal·atm"}
                             }
Convect_Date.display.energy["μJ"]=Convect_Date.display.energy["uj"]
Convect_Date.display.energy["TW.h"]={"太瓦时","TW·h"}
Convect_Date.display.energy["GW.h"]={"吉瓦时","TW·h"}
Convect_Date.display.energy["MW.h"]={"兆瓦时","TW·h"}
Convect_Date.display.energy["kW.h"]={"千瓦时","TW·h"}
Convect_Date.display.energy["W.h"]={"瓦时","TW·h"}
Convect_Date.display.energy["ftlb-f"]={"英尺磅力","ft·lb<sub>f</sub>"}
Convect_Date.display.energy["inbl-f"]={"英尺磅力","in·lb<sub>f</sub>"}
Convect_Date.display.energy["inoz-f"]={"英寸磅司力","in·oz<sub>f</sub>"}
Convect_Date.display.energy["BTU"]={"英热单位","BTU"}
Convect_Date.display.energy["GtonTNT"]={"吉吨TNT当量","GtonTNT"}
Convect_Date.display.energy["MtonTNT"]={"兆吨TNT当量","MtonTNT"}
Convect_Date.display.energy["ktonTNT"]={"千吨TNT当量","ktonTNT"}
Convect_Date.display.energy["tonTNT"]={"吨TNT当量","tonTNT"}
Convect_Date.display.energy["cufootnaturalgas"]={"立方英尺天然气当量","cubicfoot of naturalgas"}
Convect_Date.display.energy["Latm"]=Convect_Date.display.energy["latm"]
Convect_Date.display.energy["usgalatm"]=Convect_Date.display.energy["USgalatm"]
Convect_Date.display.energy["U.S.galatm"]={"美制加仑-大气压","U.S. gal·atm"}
 
--温度
Convect_Date.display.temperature={
                                    --国际单位制
                                    ["K"]={"开尔文","K"},
                                    ["C"]={"摄氏度","°C"},
                                    --英制和美国常用
                                    ["R"]={"兰氏度","°R"},
                                    ["F"]={"华氏度","°F"}
                                  }
Convect_Date.display.temperature["°C"]=Convect_Date.display.temperature["C"]
Convect_Date.display.temperature["°R"]=Convect_Date.display.temperature["R"]
Convect_Date.display.temperature["°F"]=Convect_Date.display.temperature["F"]
 
--质量
Convect_Date.display.mass={
                            --国际单位制
                            ["kg"]={"千克","kg"},
                            ["g"]={"克","g"},
                            ["mg"]={"毫克","mg"},
                            ["ug"]={"微克","μg"},
                            --非国际单位制
                            ["t"]={"公吨","t"},
                            --常衡
                            ["LT"]={"长吨",nil},
                            ["ST"]={"短吨",nil},
                            ["st"]={"英式","st"},
                            ["lb"]={"磅","lb"},
                            ["oz"]={"盎司","oz"},
                            ["drachm"]={"打兰",nil},
                            ["gr"]={"格令","gr"},
                            --金衡
                            ["ozt"]={"金衡盎司","ozt"},
                            --其他
                            ["carat"]={"克拉",""}
                           }
Convect_Date.display.mass["μg"]=Convect_Date.display.mass["ug"]
Convect_Date.display.mass["MT"]=Convect_Date.display.mass["t"]
Convect_Date.display.mass["long ton"]=Convect_Date.display.mass["LT"]
Convect_Date.display.mass["short ton"]=Convect_Date.display.mass["ST"]
Convect_Date.display.mass["dram"]={"dram",nil}
 
--力矩
Convect_Date.display.torque={
                                --国际单位制
                                ["Nm"]={"牛顿米","N·m"},
                                --非国际单位制
                                ["kgm"]={"千克米","kg·m"},
                                --英制和美国常用
                                ["ftlb"]={"英尺磅力","ft·lb"}
                             }
Convect_Date.display.torque["kgf.m"]={"千克力米","kgf·m"}
Convect_Date.display.torque["lbfft"]={"磅力英尺","lbf·ft"}
 
--[[
    链接值
    （{"<链接值>={"<单位号>",...},..."}）
--]]
--长度
Convect_Date.link.length={
                            --国际单位制
                            ["兆米"]={"Mm"},
                            ["千米"]={"km"},
                            ["米"]={"m"},
                            ["厘米"]={"cm"},
                            ["毫米"]={"mm"},
                            ["微米"]={"um","μm"},
                            ["纳米"]={"nm"},
                            --非国际单位制
                            ["埃"]={"Å","angstrom"},
                            --英制和美国常用
                            ["英里"]={"mi"},
                            ["浪 (量度单位)"]={"furlong"},
                            ["链 (量度单位)"]={"chain"},
                            ["棒 (量度单位)"]={"rd"},
                            ["英寻"]={"fathom"},
                            ["码"]={"yd"},
                            ["英尺"]={"ft","foot"},
                            ["英寸"]={"in"},
                            --其他
                            ["海里"]={"nmi"},
                            ["秒差距"]={"pc"},
                            ["光年"]={"ly"},
                            ["天文单位"]={"AU"}
                          }
 
--面积
Convect_Date.link.area={
                            --国际单位制
                            ["平方千米"]={"km2"},
                            ["平方米"]={"m2"},
                            ["平方厘米"]={"cm2"},
                            ["平方毫米"]={"mm2"},
                            --非国际单位制
                            ["公顷"]={"ha"},
                            --中国市制
                            ["亩"]={"mu"},
                            ["平方英里"]={"sqmi"},
                            ["英亩"]={"acre"},
                            ["平方码"]={"sqyd"},
                            ["平方英尺"]={"sqft","sqfoot"},
                            ["平方英寸"]={"sqin"},
                            --其他
                            ["海里"]={"sqnmi"},
                            ["德南"]={"dunam"},
                            ["坪"]={"tsubo"}
                        }
 
--体积
Convect_Date.link.volume={
                            --国际单位制
                            ["立方米"]={"m3"},
                            ["立方厘米"]={"cm3"},
                            ["立方毫米"]={"mm3"},
                            --非国际单位制
                            ["千升"]={"kl","kL"},
                            ["升"]={"l","L"},
                            ["厘升"]={"cl","cL"},
                            ["毫升"]={"ml","mL"},
                            --英制和美国常用
                            ["立方码"]={"cuyd"},
                            ["立方英尺"]={"cuft","cufoot"},
                            ["立方英寸"]={"cuin"},
                            ["桶 (单位)"]={"impbbl","USbbl","U.S.bbl","oilbbl","USbeerbbl","usbeerbbl","U.S.beerbbl","USdrybbl","U.S.drybbl"},
                            ["蒲式耳"]={"impbu","impbsh","USbsh","U.S.bsh","USbu","U.S.bu"},
                            ["加仑"]={"impgal","USgal","U.S.gal","USdrygal","U.S.drygal"},
                            ["夸脱"]={"impqt","USqt","U.S.qt","USdryqt","U.S.dryqt"},
                            ["品脱"]={"imppt","USpt","U.S.pt","USdrypt","U.S.drypt"},
                            ["盎司"]={"impoz","impfloz","USoz","U.S.oz","USfloz","U.S.floz"}
                          }
 
--速度
Convect_Date.link.speed={
                            --国际单位制
                            ["米每秒"]={"m/s"},
                            --非国际单位制
                            ["千米每时"]={"km/h"},
                            --英制和美国常用
                            ["英里每小时"]={"mph"},
                            ["英尺每秒"]={"ft/s","foot/s"},
                            --海事单位
                            ["节 (单位)"]={"kn","knot"}
                         }
 
--力
Convect_Date.link.force={
                            --国际单位制
                            ["牛顿 (单位)"]={"GN","MN","kN","N","mN","μN","uN","nN"},
                            --厘米-克-秒
                            ["达因"]={"Mdyn","kdyn","dyn","dyne","mdyn"},
                            --公制重力单位
                            ["吨力"]={"tf","t-f"},
                            ["千克力"]={"kgf","kg-f"},
                            ["克力"]={"gf","g-f"},
                            ["毫克力"]={"mgf","mg-f"},
                            --常衡基础单位
                            ["磅达"]={"pdl"},
                            ["英噸"]={"LTf","LF-f","STf","ST-f"},
                            ["磅力"]={"lb-f","lbf","grf","gr-f"}
                         }
 
--能量
Convect_Date.link.energy={
                            --国际单位制
                            ["焦耳"]={"GJ","MJ","kJ","hJ","daJ","J","dJ","cJ","mJ","uJ","μJ","nJ"},
                            --厘米-克-秒
                            ["尔格"]={"Merg","kerg","erg"},
                            --瓦特时复合
                            ["瓦时"]={"TWh","GWh","MWh","kWh","Wh","TW.h","GW.h","MW.h","kW.h","W.h"},
                            --电子伏特复合
                            ["电子伏特"]={"GeV","MeV","eV","meV"},
                            --卡路里复合
                            ["卡路里"]={"Cal","Mcal","kcal","cal","mcal"},
                            --磅/力/-英寸/英寸-时-分-秒
                            ["英尺磅达"]={"ftpdl"},
                            ["英尺磅力"]={"ftlbf","inlbf","inozf","ftlb-f","inlb-f","inoz-f"},
                            ["马力小时"]={"hph"},
                            --英热单位
                            ["英热单位"]={"Btu","BTU"},
                            --爆炸当量
                            ["爆炸当量"]={"GtTNT","MtTNT","ktTNT","tTNT","GtonTNT","MtonTNT","ktonTNT","tonTNT"},
                            --其他
                            ["哈特里"]={"Eh"},
                            ["里特伯"]={"Ry"},
                            ["吨油当量"]={"toe"},
                            ["桶油当量"]={"BOE"},
                            ["立方英尺天然气当量"]={"cuftnaturalgas","cufootnaturalgas"},
                            ["标准大气压"]={"latm","Latm","impgalatm","USgalatm","usgalatm","U.S.galatm"}
                          }
 
--温度
Convect_Date.link.temperature={
                                --国际单位制
                                ["开氏文"]={"K"},
                                ["摄氏温标"]={"C","°C"},
                                --英制和美国常用
                                ["兰氏度"]={"R","°R"},
                                ["华氏度"]={"F","°F"}
                               }
 
--质量
Convect_Date.link.mass={
                        --国际单位制
                        ["千克"]={"kg"},
                        ["克"]={"g"},
                        ["毫克"]={"mg"},
                        ["微克"]={"ug","μg"},
                        --非国际单位制
                        }
 
--力矩
Convect_Date.link.torque={
                          --国际单位制
                          ["牛顿米"]={"Nm"},
                          ["千克米"]={"kgm"},
                          ["千克力米"]={"ftlb"},
                          ["英尺磅力"]={"kgf.m"},
                          ["磅力英尺"]={"lbfft"}
                          }
 
return Convect_Date