local Convect_Date={
	["value"]={["length"]={},["area"]={},["volume"]={},["speed"]={},["force"]={},["energy"]={},["temperature"]={},["mass"]={},["torque"]={}},
	["display"]={["length"]={},["area"]={},["volume"]={},["speed"]={},["force"]={},["energy"]={},["temperature"]={},["mass"]={},["torque"]={}},
	["link"]={["length"]={},["area"]={},["volume"]={},["speed"]={},["force"]={},["energy"]={},["temperature"]={},["mass"]={},["torque"]={}}
}

--[[
    ת��ֵ
    ���ȣ���׼Ϊm
--]]
Convect_Date.value.length={
                            --���ʵ�λ��
                            ["m"]=1,
                            ["Mm"]=1000000,
                            ["km"]=1000,
                            ["cm"]=0.01,
                            ["mm"]=0.001,
                            ["um"]=0.000001,
                            ["nm"]=0.000000001,
                            --�ǹ��ʵ�λ��
                            ["angstrom"]=0.0000000001,
                            --Ӣ�ƺ���������
                            ["mi"]=1609.344,
                            ["furlong"]=201.168,
                            ["chain"]=20.1168,
                            ["rd"]=5.0292,
                            ["fathom"]=1.8288,
                            ["yd"]=0.9144,
                            ["foot"]=0.3048,
                            ["in"]=0.0254,
                            --����
                            ["nmi"]=1852,
                            ["pc"]=3.0856775814672e16,
                            ["ly"]=9.4607304725808e15,
                            ["AU"]=149597870700
                            }
Convect_Date.value.length["��m"]=Convect_Date.value.length["um"]
Convect_Date.value.length["?"]=Convect_Date.value.length["angstrom"]
Convect_Date.value.length["ft"]=Convect_Date.value.length["foot"]

--�������׼Ϊm2
Convect_Date.value.area={
                          --���ʵ�λ��
                          ["m2"]=1,
                          ["km2"]=1000000,
                          ["cm2"]=0.0001,
                          ["mm2"]=0.000001,
                          --�ǹ��ʵ�λ��
                          ["ha"]=10000,
                          --����
                          ["mu"]=((2/3)*1000),
                          --Ӣ�ƺ���������
                          ["sqmi"]=2589988.110336,
                          ["acre"]=4046.856422,
                          ["sqyd"]=0.83612736,
                          ["sqfoot"]=0.09290304,
                          ["sqin"]=0.00064516,
                          --����
                          ["sqnmi"]=3429904,
                          ["dunam"]=1000,
                          ["tsubo"]=(400/121)
                         }
Convect_Date.value.area["sqft"]=Convect_Date.value.area["sqfoot"]

--�������׼Ϊm3
Convect_Date.value.volume={
                            --���ʵ�λ��
                            ["m3"]=1,
                            ["cm3"]=0.000001,
                            ["mm3"]=0.000000001,
                            --�ǹ��ʵ�λ��
                            ["kl"]=1,
                            ["l"]=0.001,
                            ["cl"]=0.00001,
                            ["ml"]=0.000001,
                            --Ӣ�ƺ���������
                            ["cuyd"]=0.764554857984,
                            ["cufoot"]=0.028316846592,
                            ["cuin"]=0.000016387064,
                            --Ӣ��
                            ["impbbl"]=0.16365924,
                            ["impbsh"]=0.03636872,
                            ["impgal"]=0.00454609,
                            ["impqt"]=0.0011365225,
                            ["imppt"]=0.00056826125,
                            ["impoz"]=0.0000284130625,
                            --��������Һ�����
                            ["USbbl"]=0.119240471196,
                            ["oilbbl"]=0.158987294928,
                            ["USbeerbbl"]=0.117347765304,
                            ["USgal"]=0.003785411784,
                            ["USqt"]=0.000946352946,
                            ["USpt"]=0.000473176473,
                            ["USoz"]=0.0000295735295625,
                            --�������ù������
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

--�ٶȣ���׼Ϊm/s
Convect_Date.value.speed={
                           --���ʵ�λ��
                           ["m/s"]=1,
                           --�ǹ��ʵ�λ��
                           ["km/h"]=(5/18),
                           --Ӣ�ƺ���������
                           ["mph"]=0.44704,
                           ["ft/s"]=0.3048,
                           --���µ�λ
                           ["knot"]=(4.63/9)
                           }
Convect_Date.value.speed["foot/s"]=Convect_Date.value.speed["ft/s"]
Convect_Date.value.speed["kn"]=Convect_Date.value.speed["knot"]

--������׼ΪN
Convect_Date.value.force={
                           --���ʵ�λ��
                           ["N"]=1,
                           ["GN"]=1000000000,
                           ["MN"]=1000000,
                           ["kN"]=1000,
                           ["mN"]=0.001,
                           ["uN"]=0.000001,
                           ["nN"]=0.000000001,
                           --����-��-��
                           ["Mdyn"]=10,
                           ["kdyn"]=0.01,
                           ["dyn"]=0.00001,
                           ["mdyn"]=0.00000001,
                           --����������λ
                           ["t-f"]=9806.65,
                           ["kg-f"]=9.80665,
                           ["g-f"]=0.00980665,
                           ["mg-f"]=0.00000980665,
                           --���������λ
                           ["pdl"]=0.138254954376,
                           ["LT-f"]=9964.01641818352,
                           ["ST-f"]=8896.443230521,
                           ["lb-f"]=4.4482216152605,
                           ["gr-f"]=0.0006354602307515
                          }
Convect_Date.value.force["��N"]=Convect_Date.value.force["uN"]
Convect_Date.value.force["dyne"]=Convect_Date.value.force["dyn"]
Convect_Date.value.force["tf"]=Convect_Date.value.force["t-f"]
Convect_Date.value.force["kgf"]=Convect_Date.value.force["kg-f"]
Convect_Date.value.force["gf"]=Convect_Date.value.force["g-f"]
Convect_Date.value.force["mgf"]=Convect_Date.value.force["mg-f"]
Convect_Date.value.force["LTf"]=Convect_Date.value.force["LT-f"]
Convect_Date.value.force["STf"]=Convect_Date.value.force["ST-f"]
Convect_Date.value.force["lbf"]=Convect_Date.value.force["lb-f"]
Convect_Date.value.force["grf"]=Convect_Date.value.force["gr-f"]

--��������׼ΪJ
Convect_Date.value.energy={
                           --���ʵ�λ��
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
                           --����-��-��
                           ["Merg"]=0.1,
                           ["kerg"]=0.0001,
                           ["erg"]=0.0000001,
                           --����ʱ����
                           ["TWh"]=3.6e15,
                           ["GWh"]=3.6e12,
                           ["MWh"]=3600000000,
                           ["kWh"]=3600000,
                           ["Wh"]=3600,
                           --���ӷ���
                           ["GeV"]=0.0000000001602176487,
                           ["MeV"]=1.602176487e-13,
                           ["keV"]=1.602176487e-16,
                           ["eV"]=1.602176487e-19,
                           ["meV"]=1.602176487e-22,
                           --��·�︴��
                           ["Cal"]=4184,
                           ["Mcal"]=4814000,
                           ["kcal"]=4184,
                           ["cal"]=4.184,
                           ["mcal"]=0.004814,
                           --��/��/-Ӣ��/Ӣ��-ʱ-��-��
                           ["ftpdl"]=0.0421401100938048,
                           ["ftlbf"]=1.3558179483314004,
                           ["inlbf"]=0.1129848290276167,
                           ["inozf"]=0.00706155181422604375,
                           ["hph"]=2684519.537696172792,
                           --Ӣ�ȵ�λ
                           ["Btu"]=1,055.05585262,
                           --��ը����ϵ�е�λ
                           ["GtTNT"]=4.1840e18,
                           ["MtTNT"]=4.184e15,
                           ["ktTNT"]=4.184e12,
                           ["tTNT"]=4184000000,
                           --����
                           ["Eh"]=4.35974417e-18,
                           ["Ry"]=2.1798741e-18,
                           ["toe"]=41868000000,
                           ["BOE"]=6117863200,
                           ["cuftnaturalgas"]=1055055.85262,
                           ["latm"]=101.325,
                           ["impgalatm"]=460.63256925,
                           ["USgalatm"]=383.5568490138
                           }
Convect_Date.value.energy["��J"]=Convect_Date.value.energy["uj"]
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
--�¶ȣ���׼ΪK
Convect_Date.value.temperature={
                                 --���ʵ�λ��
                                 ["K"]={function(input) return 1*input end,function(input) return 1*input end},
                                 ["C"]={function(input) return (input+273.15) end ,function(input) return input-273.15 end},
                                 --Ӣ�ƺ���������
                                 ["R"]={function(input) return (input/1.8) end,function(input) return input*1.8 end},
                                 ["F"]={function(input) return ((input+459.67)/1.8) end,function(input) return input*1.8-459.67 end}
                                 }
Convect_Date.value.temperature["��C"]=Convect_Date.value.temperature["C"]
Convect_Date.value.temperature["��R"]=Convect_Date.value.temperature["R"]
Convect_Date.value.temperature["��F"]=Convect_Date.value.temperature["F"]

--����mw.loadData()�������ر��ӱ���ں�������������main.lua
--]]


--��������׼Ϊkg
Convect_Date.value.mass={
                          --���ʵ�λ��
                          ["kg"]=1,
                          ["g"]=0.001,
                          ["mg"]=0.000001,
                          ["ug"]=0.000000001,
                          --�ǹ��ʵ�λ��
                          ["t"]=1000,
                          --����
                          ["LT"]=1016.0469088,
                          ["ST"]=907.18474,
                          ["st"]=6.35029318,
                          ["lb"]=0.45359237,
                          ["oz"]=0.028349523,
                          ["drachm"]=0.001771845195,
                          ["gr"]=0.00006479891,
                          --���
                          ["ozt"]=0.0311034768,
                          --����
                          ["carat"]=0.0002
                         }
Convect_Date.value.mass["��g"]=Convect_Date.value.mass["ug"]
Convect_Date.value.mass["MT"]=Convect_Date.value.mass["t"]
Convect_Date.value.mass["long ton"]=Convect_Date.value.mass["LT"]
Convect_Date.value.mass["short ton"]=Convect_Date.value.mass["ST"]
Convect_Date.value.mass["dram"]=Convect_Date.value.mass["drachm"]

--���أ���׼ΪNm
Convect_Date.value.torque={
                            --���ʵ�λ��
                            ["Nm"]=1,
                            --�ǹ��ʵ�λ��
                            ["kgm"]=9.80665,
                            --Ӣ�ƺ���������
                            ["ftlb"]=1.3558179483314004
                           }
Convect_Date.value.torque["kgf.m"]=Convect_Date.value.torque["kgm"]
Convect_Date.value.torque["lbfft"]=Convect_Date.value.torque["ftlb"]

--[[
    ��ʾֵ������������д��or���ţ�
--]]
--����
Convect_Date.display.length={
                                --���ʵ�λ��
                                ["m"]={"��","m"},
                                ["Mm"]={"����","Mm"},
                                ["km"]={"ǧ��","km"},
                                ["cm"]={"����","cm"},
                                ["mm"]={"����","mm"},
                                ["um"]={"΢��","��m"},
                                ["nm"]={"����","nm"},
                                --�ǹ��ʵ�λ��
                                ["angstrom"]={"��","?"},
                                --Ӣ�ƺ���������
                                ["mi"]={"Ӣ��","Ӣ��"},
                                ["furlong"]={"��",nil},
                                ["chain"]={"��",nil},
                                ["rd"]={"��","rd"},
                                ["fathom"]={"ӢѰ",nil},
                                ["yd"]={"��","yd"},
                                ["ft"]={"Ӣ��","ft"},
                                ["in"]={"Ӣ��","in"},
                                --����
                                ["nmi"]={"����","nmi"},
                                ["pc"]={"����","pc"},
                                ["ly"]={"����","ly"},
                                ["AU"]={"���ĵ�λ","AU"},
                             }
Convect_Date.display.length["��m"]={"΢��","��m"}
Convect_Date.display.length["?"]={"��","?"}
Convect_Date.display.length["foot"]={"Ӣ��","foot"}

--���
Convect_Date.display.area={
                              --���ʵ�λ��
                              ["m2"]={"ƽ����","m<sup>2</sup>"},
                              ["km2"]={"ƽ��ǧ��","km<sup>2</sup>"},
                              ["cm2"]={"ƽ������","cm<sup>2</sup>"},
                              ["mm2"]={"ƽ������","mm<sup>2</sup>"},
                              --�ǹ��ʵ�λ��
                              ["ha"]={"����","ha"},
                              --����
                              ["mu"]={"Ķ","mu"},
                              --Ӣ�ƺ���������
                              ["sqmi"]={"ƽ��Ӣ��","ƽ��Ӣ��"},
                              ["acre"]={"ӢĶ",nil},
                              ["sqyd"]={"ƽ����","sq yd"},
                              ["sqft"]={"ƽ��Ӣ��","sq ft"},
                              ["sqin"]={"ƽ��Ӣ��","sq in"},
                              --����
                              ["sqnmi"]={"ƽ������","sq nmi"},
                              ["dunam"]={"����",nil},
                              ["tsubo"]={"ƺ",nil}
                           }
Convect_Date.display.area["sqfoot"]={"ƽ��Ӣ��","square foot"}

--���
Convect_Date.display.volume={
                                --���ʵ�λ��
                                ["m3"]={"������","m<sup>3</sup>"},
                                ["cm3"]={"��������","cm<sup>3</sup>"},
                                ["mm3"]={"��������","mm<sup>3</sup>"},
                                --�ǹ��ʵ�λ��
                                ["kl"]={"ǧ��","kL"},
                                ["l"]={"��","L"},
                                ["cl"]={"����","cL"},
                                ["ml"]={"����","mL"},
                                --Ӣ�ƺ���������
                                ["cuyd"]={"������","cu yd"},
                                ["cuft"]={"����Ӣ��","cu ft"},
                                ["cuin"]={"����Ӣ��","cu in"},
                                --Ӣ��
                                ["impbbl"]={"Ӣ��Ͱ","imp bbl"},
                                ["impbsh"]={"Ӣ����ʽ��","imp bsh"},
                                ["impgal"]={"Ӣ�Ƽ���","imp gal"},
                                ["impqt"]={"Ӣ�ƿ���","imp qt"},
                                ["imppt"]={"Ӣ��Ʒ��","imp pt"},
                                ["impoz"]={"Ӣ��Һ�尻˾","imp fl oz"},
                                --��������Һ�����
                                ["USbbl"]={"����Ͱ","US bbl"},
                                ["oilbbl"]={"Ͱ","bbl"},
                                ["USbeerbbl"]={"����ơ��Ͱ","US bbl"},
                                ["USgal"]={"���Ƽ���","US gal"},
                                ["USqt"]={"���ƿ���","US qt"},
                                ["USpt"]={"����Ʒ��","US pt"},
                                ["USoz"]={"����Һ�尻˾","US fl oz"},
                                --�������ù������
                                ["USdrybbl"]={"���Ƹ�Ͱ","US dry bbl"},
                                ["USbsh"]={"������ʽ��","US bsh"},
                                ["USbu"]={"������ʽ��","US bu"},
                                ["USdrygal"]={"���Ƹ�������","US dry gal"},
                                ["USdryqt"]={"���Ƹ�������","US dry qt"},
                                ["USdrypt"]={"���Ƹ���Ʒ��","US dry pt"}
                             }
Convect_Date.display.volume["cc"]={"��������","cm<sup>3</sup>"}
Convect_Date.display.volume["kL"]={"ǧ��","kL"}
Convect_Date.display.volume["L"]={"��","L"}
Convect_Date.display.volume["cL"]={"����","cL"}
Convect_Date.display.volume["mL"]={"����","mL"}
Convect_Date.display.volume["cufoot"]={"����Ӣ��","cubic foot"}
Convect_Date.display.volume["impbu"]={"Ӣ����ʽ��","imp bsh"}
Convect_Date.display.volume["impfloz"]={"Ӣ��Һ�尻˾","imp fl oz"}
Convect_Date.display.volume["U.S.bbl"]={"����Ͱ","U.S. bbl"}
Convect_Date.display.volume["usbeerbbl"]={"����ơ��Ͱ","US bbl"}
Convect_Date.display.volume["U.S.beerbbl"]={"����ơ��Ͱ","U.S. bbl"}
Convect_Date.display.volume["U.S.gal"]={"���Ƽ���","U.S. gal"}
Convect_Date.display.volume["U.S.qt"]={"���ƿ���","U.S. qt"}
Convect_Date.display.volume["U.S.pt"]={"����Ʒ��","U.S. pt"}
Convect_Date.display.volume["USfloz"]={"����Һ�尻˾","US fl oz"}
Convect_Date.display.volume["U.S.oz"]={"����Һ�尻˾","US fl oz"}
Convect_Date.display.volume["U.S.floz"]={"����Һ�尻˾","U.S. fl oz"}
Convect_Date.display.volume["U.S.drybbl"]={"���Ƹ�Ͱ","U.S. dry bbl"}
Convect_Date.display.volume["U.S.bsh"]={"������ʽ��","U.S. bsh"}
Convect_Date.display.volume["U.S.bu"]={"������ʽ��","U.S. bu"}
Convect_Date.display.volume["U.S.drygal"]={"���Ƹ�������","U.S. dry gal"}
Convect_Date.display.volume["U.S.dryqt"]={"���Ƹ�������","U.S. dry qt"}
Convect_Date.display.volume["U.S.drypt"]={"���Ƹ���Ʒ��","U.S. dry pt"}

--�ٶ�
Convect_Date.display.speed={
                               --���ʵ�λ��
                               ["m/s"]={"��ÿ��","m/s"},
                               --�ǹ��ʵ�λ��
                               ["km/h"]={"ǧ��ÿСʱ","km/s"},
                               --Ӣ�ƺ���������
                               ["mph"]={"Ӣ��ÿСʱ","mph"},
                               ["ft/s"]={"Ӣ��ÿ��","ft/s"},
                               --���µ�λ
                               ["knot"]={"��","kn"}
                            }
Convect_Date.display.speed["foot/s"]=Convect_Date.display.speed["ft/s"]
Convect_Date.display.speed["kn"]=Convect_Date.display.speed["knot"]

--��
Convect_Date.display.force={
                                --���ʵ�λ��
                                ["N"]={"ţ��","N"},
                                ["GN"]={"��ţ��","GN"},
                                ["MN"]={"��ţ��","NM"},
                                ["kN"]={"ǧţ��","kN"},
                                ["mN"]={"��ţ��","mN"},
                                ["uN"]={"΢ţ��","��N"},
                                ["nN"]={"��ţ��","nN"},
                                --����-��-��
                                ["Mdyn"]={"�״���","Mdyn"},
                                ["kdyn"]={"ǧ����","kdyn"},
                                ["dyn"]={"����","dyn"},
                                ["mdyn"]={"������","mdyn"},
                                --����������λ
                                ["t-f"]={"����","t<sub>f</sub>"},
                                ["kg-f"]={"ǧ����","kg<sub>f</sub>"},
                                ["g-f"]={"����","g<sub>f</sub>"},
                                ["mg-f"]={"������","mg<sub>f</sub>"},
                                --���������λ
                                ["pdl"]={"����","pdl"},
                                ["LT-f"]={"������","LT<sub>f</sub>"},
                                ["ST-f"]={"�̶���","ST<sub>f</sub>"},
                                ["lb-f"]={"����","lb<sub>f</sub>"},
                                ["gr-f"]={"������","gr<sub>f</sub>"}
                            }
Convect_Date.display.force["��N"]=Convect_Date.display.force["uN"]
Convect_Date.display.force["dyne"]=Convect_Date.display.force["dyn"]
Convect_Date.display.force["tf"]={"����","tf"}
Convect_Date.display.force["kgf"]={"ǧ����","kgf"}
Convect_Date.display.force["gf"]={"����","gf"}
Convect_Date.display.force["mgf"]={"������","mgf"}
Convect_Date.display.force["LTf"]={"������","LTf"}
Convect_Date.display.force["STf"]={"�̶���","STf"}
Convect_Date.display.force["lbf"]={"����","lbf"}
Convect_Date.display.force["grf"]={"������","grf"}

--����
Convect_Date.display.energy={
                                --���ʵ�λ��
                                ["J"]={"����","J"},
                                ["GJ"]={"����","GJ"},
                                ["MJ"]={"�׽�","MJ"},
                                ["kj"]={"ǧ��","kJ"},
                                ["hj"]={"�ٽ�","hJ"},
                                ["daj"]={"ʮ��","daJ"},
                                ["dj"]={"�ֽ���","dJ"},
                                ["mj"]={"������","mJ"},
                                ["cj"]={"�役��","cJ"},
                                ["uj"]={"΢����","��J"},
                                ["nj"]={"�ɽ���","nJ"},
                                --����-��-��
                                ["Merg"]={"�׶���","Merg"},
                                ["kerg"]={"ǧ����","kerg"},
                                ["erg"]={"����","erg"},
                                --����ʱ����
                                ["TWh"]={"̫��ʱ","TWh"},
                                ["GWh"]={"����ʱ","GWh"},
                                ["MWh"]={"����ʱ","MWh"},
                                ["kWh"]={"ǧ��ʱ","kWh"},
                                ["Wh"]={"��ʱ","Wh"},
                                --���ӷ���
                                ["GeV"]={"�����ӷ�","GeV"},
                                ["MeV"]={"�׵��ӷ�","MeV"},
                                ["keV"]={"ǧ���ӷ�","keV"},
                                ["eV"]={"���ӷ���","eV"},
                                ["meV"]={"�����ӷ���","meV"},
                                --��·�︴��
                                ["Cal"]={"��·��","Cal"},
                                ["Mcal"]={"�׿�","Mcal"},
                                ["kcal"]={"ǧ��","kcal"},
                                ["cal"]={"��·��","cal"},
                                ["mcal"]={"����","mcal"},
                                --��/��/-Ӣ��/Ӣ��-ʱ-��-��
                                ["ftpdl"]={"Ӣ�߰���","ft��pal"},
                                ["ftlbf"]={"Ӣ�߰���","ft��lbf"},
                                ["inlbf"]={"Ӣ�߰���","in��lbf"},
                                ["inozf"]={"Ӣ���˾��","in��ozf"},
                                ["hph"]={"����Сʱ","hp��h"},
                                --Ӣ�ȵ�λ
                                ["Btu"]={"Ӣ�ȵ�λ","Btu"},
                                --��ը����ϵ�е�λ
                                ["GtTNT"]={"���ֵ���","GtTNT"},
                                ["MtTNT"]={"�׶�TNT����","MtTNT"},
                                ["ktTNT"]={"ǧ��TNT����","ktTNT"},
                                ["tTNT"]={"��TNT����","tTNT"},
                                --����
                                ["Eh"]={"������","''E''h"},
                                ["Ry"]={"���ز�","Ry"},
                                ["toe"]={"���͵���","toe"},
                                ["BOE"]={"Ͱ�͵���","BOE"},
                                ["cuftnaturalgas"]={"����Ӣ����Ȼ������",nil},
                                ["latm"]={"��-����ѹ","l��atm"},
                                ["impgalatm"]={"����-����ѹ","imp gal��atm"},
                                ["USgalatm"]={"���Ƽ���-����ѹ","US gal��atm"}
                             }
Convect_Date.display.energy["��J"]=Convect_Date.display.energy["uj"]
Convect_Date.display.energy["TW.h"]={"̫��ʱ","TW��h"}
Convect_Date.display.energy["GW.h"]={"����ʱ","TW��h"}
Convect_Date.display.energy["MW.h"]={"����ʱ","TW��h"}
Convect_Date.display.energy["kW.h"]={"ǧ��ʱ","TW��h"}
Convect_Date.display.energy["W.h"]={"��ʱ","TW��h"}
Convect_Date.display.energy["ftlb-f"]={"Ӣ�߰���","ft��lb<sub>f</sub>"}
Convect_Date.display.energy["inbl-f"]={"Ӣ�߰���","in��lb<sub>f</sub>"}
Convect_Date.display.energy["inoz-f"]={"Ӣ���˾��","in��oz<sub>f</sub>"}
Convect_Date.display.energy["BTU"]={"Ӣ�ȵ�λ","BTU"}
Convect_Date.display.energy["GtonTNT"]={"����TNT����","GtonTNT"}
Convect_Date.display.energy["MtonTNT"]={"�׶�TNT����","MtonTNT"}
Convect_Date.display.energy["ktonTNT"]={"ǧ��TNT����","ktonTNT"}
Convect_Date.display.energy["tonTNT"]={"��TNT����","tonTNT"}
Convect_Date.display.energy["cufootnaturalgas"]={"����Ӣ����Ȼ������","cubicfoot of naturalgas"}
Convect_Date.display.energy["Latm"]=Convect_Date.display.energy["latm"]
Convect_Date.display.energy["usgalatm"]=Convect_Date.display.energy["USgalatm"]
Convect_Date.display.energy["U.S.galatm"]={"���Ƽ���-����ѹ","U.S. gal��atm"}

--�¶�
Convect_Date.display.temperature={
                                    --���ʵ�λ��
                                    ["K"]={"������","K"},
                                    ["C"]={"���϶�","��C"},
                                    --Ӣ�ƺ���������
                                    ["R"]={"���϶�","��R"},
                                    ["F"]={"���϶�","��F"}
                                  }
Convect_Date.display.temperature["��C"]=Convect_Date.display.temperature["C"]
Convect_Date.display.temperature["��R"]=Convect_Date.display.temperature["R"]
Convect_Date.display.temperature["��F"]=Convect_Date.display.temperature["F"]

--����
Convect_Date.display.mass={
                            --���ʵ�λ��
                            ["kg"]={"ǧ��","kg"},
                            ["g"]={"��","g"},
                            ["mg"]={"����","mg"},
                            ["ug"]={"΢��","��g"},
                            --�ǹ��ʵ�λ��
                            ["t"]={"����","t"},
                            --����
                            ["LT"]={"����",nil},
                            ["ST"]={"�̶�",nil},
                            ["st"]={"Ӣʽ","st"},
                            ["lb"]={"��","lb"},
                            ["oz"]={"��˾","oz"},
                            ["drachm"]={"����",nil},
                            ["gr"]={"����","gr"},
                            --���
                            ["ozt"]={"��ⰻ˾","ozt"},
                            --����
                            ["carat"]={"����",""}
                           }
Convect_Date.display.mass["��g"]=Convect_Date.display.mass["ug"]
Convect_Date.display.mass["MT"]=Convect_Date.display.mass["t"]
Convect_Date.display.mass["long ton"]=Convect_Date.display.mass["LT"]
Convect_Date.display.mass["short ton"]=Convect_Date.display.mass["ST"]
Convect_Date.display.mass["dram"]={"dram",nil}

--����
Convect_Date.display.torque={
                                --���ʵ�λ��
                                ["Nm"]={"ţ����","N��m"},
                                --�ǹ��ʵ�λ��
                                ["kgm"]={"ǧ����","kg��m"},
                                --Ӣ�ƺ���������
                                ["ftlb"]={"Ӣ�߰���","ft��lb"}
                             }
Convect_Date.display.torque["kgf.m"]={"ǧ������","kgf��m"}
Convect_Date.display.torque["lbfft"]={"����Ӣ��","lbf��ft"}

--[[
    ����ֵ
    ��{"<����ֵ>={"<��λ��>",...},..."}��
--]]
--����
Convect_Date.link.length={
                            --���ʵ�λ��
                            ["����"]={"Mm"},
                            ["ǧ��"]={"km"},
                            ["��"]={"m"},
                            ["����"]={"cm"},
                            ["����"]={"mm"},
                            ["΢��"]={"um","��m"},
                            ["����"]={"nm"},
                            --�ǹ��ʵ�λ��
                            ["��"]={"?","angstrom"},
                            --Ӣ�ƺ���������
                            ["Ӣ��"]={"mi"},
                            ["�� (���ȵ�λ)"]={"furlong"},
                            ["�� (���ȵ�λ)"]={"chain"},
                            ["�� (���ȵ�λ)"]={"rd"},
                            ["ӢѰ"]={"fathom"},
                            ["��"]={"yd"},
                            ["Ӣ��"]={"ft","foot"},
                            ["Ӣ��"]={"in"},
                            --����
                            ["����"]={"nmi"},
                            ["����"]={"pc"},
                            ["����"]={"ly"},
                            ["���ĵ�λ"]={"AU"}
                          }

--���
Convect_Date.link.area={
                            --���ʵ�λ��
                            ["ƽ��ǧ��"]={"km2"},
                            ["ƽ����"]={"m2"},
                            ["ƽ������"]={"cm2"},
                            ["ƽ������"]={"mm2"},
                            --�ǹ��ʵ�λ��
                            ["����"]={"ha"},
                            --�й�����
                            ["Ķ"]={"mu"},
                            ["ƽ��Ӣ��"]={"sqmi"},
                            ["ӢĶ"]={"acre"},
                            ["ƽ����"]={"sqyd"},
                            ["ƽ��Ӣ��"]={"sqft","sqfoot"},
                            ["ƽ��Ӣ��"]={"sqin"},
                            --����
                            ["����"]={"sqnmi"},
                            ["����"]={"dunam"},
                            ["ƺ"]={"tsubo"}
                        }

--���
Convect_Date.link.volume={
                            --���ʵ�λ��
                            ["������"]={"m3"},
                            ["��������"]={"cm3"},
                            ["��������"]={"mm3"},
                            --�ǹ��ʵ�λ��
                            ["ǧ��"]={"kl","kL"},
                            ["��"]={"l","L"},
                            ["����"]={"cl","cL"},
                            ["����"]={"ml","mL"},
                            --Ӣ�ƺ���������
                            ["������"]={"cuyd"},
                            ["����Ӣ��"]={"cuft","cufoot"},
                            ["����Ӣ��"]={"cuin"},
                            ["Ͱ (��λ)"]={"impbbl","USbbl","U.S.bbl","oilbbl","USbeerbbl","usbeerbbl","U.S.beerbbl","USdrybbl","U.S.drybbl"},
                            ["��ʽ��"]={"impbu","impbsh","USbsh","U.S.bsh","USbu","U.S.bu"},
                            ["����"]={"impgal","USgal","U.S.gal","USdrygal","U.S.drygal"},
                            ["����"]={"impqt","USqt","U.S.qt","USdryqt","U.S.dryqt"},
                            ["Ʒ��"]={"imppt","USpt","U.S.pt","USdrypt","U.S.drypt"},
                            ["��˾"]={"impoz","impfloz","USoz","U.S.oz","USfloz","U.S.floz"}
                          }

--�ٶ�
Convect_Date.link.speed={
                            --���ʵ�λ��
                            ["��ÿ��"]={"m/s"},
                            --�ǹ��ʵ�λ��
                            ["ǧ��ÿʱ"]={"km/h"},
                            --Ӣ�ƺ���������
                            ["Ӣ��ÿСʱ"]={"mph"},
                            ["Ӣ��ÿ��"]={"ft/s","foot/s"},
                            --���µ�λ
                            ["�� (��λ)"]={"kn","knot"}
                         }

--��
Convect_Date.link.force={
                            --���ʵ�λ��
                            ["ţ�� (��λ)"]={"GN","MN","kN","N","mN","��N","uN","nN"},
                            --����-��-��
                            ["����"]={"Mdyn","kdyn","dyn","dyne","mdyn"},
                            --����������λ
                            ["����"]={"tf","t-f"},
                            ["ǧ����"]={"kgf","kg-f"},
                            ["����"]={"gf","g-f"},
                            ["������"]={"mgf","mg-f"},
                            --���������λ
                            ["����"]={"pdl"},
                            ["Ӣ��"]={"LTf","LF-f","STf","ST-f"},
                            ["����"]={"lb-f","lbf","grf","gr-f"}
                         }

--����
Convect_Date.link.energy={
                            --���ʵ�λ��
                            ["����"]={"GJ","MJ","kJ","hJ","daJ","J","dJ","cJ","mJ","uJ","��J","nJ"},
                            --����-��-��
                            ["����"]={"Merg","kerg","erg"},
                            --����ʱ����
                            ["��ʱ"]={"TWh","GWh","MWh","kWh","Wh","TW.h","GW.h","MW.h","kW.h","W.h"},
                            --���ӷ��ظ���
                            ["���ӷ���"]={"GeV","MeV","eV","meV"},
                            --��·�︴��
                            ["��·��"]={"Cal","Mcal","kcal","cal","mcal"},
                            --��/��/-Ӣ��/Ӣ��-ʱ-��-��
                            ["Ӣ�߰���"]={"ftpdl"},
                            ["Ӣ�߰���"]={"ftlbf","inlbf","inozf","ftlb-f","inlb-f","inoz-f"},
                            ["����Сʱ"]={"hph"},
                            --Ӣ�ȵ�λ
                            ["Ӣ�ȵ�λ"]={"Btu","BTU"},
                            --��ը����
                            ["��ը����"]={"GtTNT","MtTNT","ktTNT","tTNT","GtonTNT","MtonTNT","ktonTNT","tonTNT"},
                            --����
                            ["������"]={"Eh"},
                            ["���ز�"]={"Ry"},
                            ["���͵���"]={"toe"},
                            ["Ͱ�͵���"]={"BOE"},
                            ["����Ӣ����Ȼ������"]={"cuftnaturalgas","cufootnaturalgas"},
                            ["��׼����ѹ"]={"latm","Latm","impgalatm","USgalatm","usgalatm","U.S.galatm"}
                          }

--�¶�
Convect_Date.link.temperature={
                                --���ʵ�λ��
                                ["������"]={"K"},
                                ["�����±�"]={"C","��C"},
                                --Ӣ�ƺ���������
                                ["���϶�"]={"R","��R"},
                                ["���϶�"]={"F","��F"}
                               }

--����
Convect_Date.link.mass={
                        --���ʵ�λ��
                        ["ǧ��"]={"kg"},
                        ["��"]={"g"},
                        ["����"]={"mg"},
                        ["΢��"]={"ug","��g"},
                        --�ǹ��ʵ�λ��
                        }

--����
Convect_Date.link.torque={
                          --���ʵ�λ��
                          ["ţ����"]={"Nm"},
                          ["ǧ����"]={"kgm"},
                          ["ǧ������"]={"ftlb"},
                          ["Ӣ�߰���"]={"kgf.m"},
                          ["����Ӣ��"]={"lbfft"}
                          }

return Convect_Date