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
Convect.value.length["��m"]=Convect.value.length["um"]
Convect.value.length["?"]=Convect.value.length["angstrom"]
Convect.value.length["ft"]=Convect.value.length["foot"]
 
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
Convect.value.area["sqft"]=Convect.value.area["sqfoot"]
 
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
Convect.value.volume["cc"]=Convect.value.volume["cm3"]
Convect.value.volume["kL"]=Convect.value.volume["kl"]
Convect.value.volume["L"]=Convect.value.volume["l"]
Convect.value.volume["cL"]=Convect.value.volume["cl"]
Convect.value.volume["mL"]=Convect.value.volume["ml"]
Convect.value.volume["cuft"]=Convect.value.volume["cufoot"]
Convect.value.volume["impbu"]=Convect.value.volume["impbsh"]
Convect.value.volume["impfloz"]=Convect.value.volume["impoz"]
Convect.value.volume["U.S.bbl"]=Convect.value.volume["USbbl"]
Convect.value.volume["usbeerbbl"]=Convect.value.volume["USbeerbbl"]
Convect.value.volume["U.S.beerbbl"]=Convect.value.volume["USbeerbbl"]
Convect.value.volume["U.S.gal"]=Convect.value.volume["USgal"]
Convect.value.volume["U.S.qt"]=Convect.value.volume["USqt"]
Convect.value.volume["U.S.pt"]=Convect.value.volume["USpt"]
Convect.value.volume["USfloz"]=Convect.value.volume["USoz"]
Convect.value.volume["U.S.oz"]=Convect.value.volume["USoz"]
Convect.value.volume["U.S.floz"]=Convect.value.volume["USoz"]
Convect.value.volume["U.S.drybbl"]=Convect.value.volume["USdrybbl"]
Convect.value.volume["U.S.bsh"]=Convect.value.volume["USbsh"]
Convect.value.volume["U.S.bu"]=Convect.value.volume["USbu"]
Convect.value.volume["U.S.drygal"]=Convect.value.volume["USdrygal"]
Convect.value.volume["U.S.dryqt"]=Convect.value.volume["USdryqt"]
Convect.value.volume["U.S.drypt"]=Convect.value.volume["USdrypt"]
 
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
Convect.value.speed["foot/s"]=Convect.value.speed["ft/s"]
Convect.value.speed["kn"]=Convect.value.speed["knot"]
 
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
Convect.value.force["��N"]=Convect.value.force["uN"]
Convect.value.force["dyne"]=Convect.value.force["dyn"]
Convect.value.force["tf"]=Convect.value.force["t-f"]
Convect.value.force["kgf"]=Convect.value.force["kg-f"]
Convect.value.force["gf"]=Convect.value.force["g-f"]
Convect.value.force["mgf"]=Convect.value.force["mg-f"]
Convect.value.force["LTf"]=Convect.value.force["LT-f"]
Convect.value.force["STf"]=Convect.value.force["ST-f"]
Convect.value.force["lbf"]=Convect.value.force["lb-f"]
Convect.value.force["grf"]=Convect.value.force["gr-f"]
 
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
Convect.value.energy["��J"]=Convect.value.energy["uj"]
Convect.value.energy["TW.h"]=Convect.value.energy["TWh"]
Convect.value.energy["GW.h"]=Convect.value.energy["GWh"]
Convect.value.energy["MW.h"]=Convect.value.energy["MWh"]
Convect.value.energy["kW.h"]=Convect.value.energy["kWh"]
Convect.value.energy["W.h"]=Convect.value.energy["Wh"]
Convect.value.energy["ftlb-f"]=Convect.value.energy["ftlbf"]
Convect.value.energy["inbl-f"]=Convect.value.energy["inlbf"]
Convect.value.energy["inoz-f"]=Convect.value.energy["inozf"]
Convect.value.energy["BTU"]=Convect.value.energy["Btu"]
Convect.value.energy["GtonTNT"]=Convect.value.energy["GtTNT"]
Convect.value.energy["MtonTNT"]=Convect.value.energy["MtTNT"]
Convect.value.energy["ktonTNT"]=Convect.value.energy["ktTNT"]
Convect.value.energy["tonTNT"]=Convect.value.energy["tTNT"]
Convect.value.energy["cufootnaturalgas"]=Convect.value.energy["cuftnaturalgas"]
Convect.value.energy["Latm"]=Convect.value.energy["latm"]
Convect.value.energy["usgalatm"]=Convect.value.energy["USgalatm"]
Convect.value.energy["U.S.galatm"]=Convect.value.energy["USgalatm"]
 
--�¶ȣ���׼ΪK
Convect_Date.value.temperature={
                                 --���ʵ�λ��
                                 ["K"]={function(input) return 1*input end,function(input) return 1*input end},
                                 ["C"]={function(input) return (input+273.15) end ,function(input) return input-273.15 end},
                                 --Ӣ�ƺ���������
                                 ["R"]={function(input) return (input/1.8) end,function(input) return input*1.8 end},
                                 ["F"]={function(input) return ((input+459.67)/1.8) end,function(input) return input*1.8-459.67 end}
                                 }
Convect.value.temperature["��C"]=Convect.value.temperature["C"]
Convect.value.temperature["��R"]=Convect.value.temperature["R"]
Convect.value.temperature["��F"]=Convect.value.temperature["F"]
 
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
Convect.value.mass["��g"]=Convect.value.mass["ug"]
Convect.value.mass["MT"]=Convect.value.mass["t"]
Convect.value.mass["long ton"]=Convect.value.mass["LT"]
Convect.value.mass["short ton"]=Convect.value.mass["ST"]
Convect.value.mass["dram"]=Convect.value.mass["drachm"]
 
--���أ���׼ΪNm
Convect_Date.value.torque={
                            --���ʵ�λ��
                            ["Nm"]=1,
                            --�ǹ��ʵ�λ��
                            ["kgm"]=9.80665,
                            --Ӣ�ƺ���������
                            ["ftlb"]=1.3558179483314004
                           }
Convect.value.torque["kgf.m"]=Convect.value.torque["kgm"]
Convect.value.torque["lbfft"]=Convect.value.torque["ftlb"]
 
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
Convect.display.length["��m"]=Convect.display.length["um"]
Convect.display.length["?"]=Convect.display.length["angstrom"]
Convect.display.length["foot"]=Convect.display.length["ft"]
    Convect.display.length["foot"][2]="foot"
 
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
Convect.display.area["sqfoot"]=Convect.display.area["sqft"]
    Convect.display.area["sqfoot"][2]="square foot"
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
Convect.display.volume["cc"]=Convect.display.volume["cm3"]
 
Convect.display.volume["kL"]=Convect.display.volume["kl"]
    Convect.display.volume["kL"][2]="kL"
 
Convect.display.volume["L"]=Convect.display.volume["l"]
    Convect.display.volume["L"][2]="L"
 
Convect.display.volume["cL"]=Convect.display.volume["cl"]
    Convect.display.volume["cL"][2]="cL"
 
Convect.display.volume["mL"]=Convect.display.volume["ml"]
    Convect.display.volume["mL"][2]="mL"
 
Convect.display.volume["cufoot"]=Convect.display.volume["cuft"]
    Convect.display.volume["cufoot"][2]="cubic foot"
 
Convect.display.volume["impbu"]=Convect.display.volume["impbsh"]
Convect.display.volume["impfloz"]=Convect.display.volume["impoz"]
 
Convect.display.volume["U.S.bbl"]=Convect.display.volume["USbbl"]
    Convect.display.volume["U.S.bbl"][2]="U.S. bbl"
 
Convect.display.volume["usbeerbbl"]=Convect.display.volume["USbeerbbl"]
Convect.display.volume["U.S.beerbbl"]=Convect.display.volume["USbeerbbl"]
    Convect.display.volume["U.S.beerbbl"][2]="U.S. bbl"
 
Convect.display.volume["U.S.gal"]=Convect.display.volume["USgal"]
    Convect.display.volume["U.S.gal"][2]="U.S. gal"
 
Convect.display.volume["U.S.qt"]=Convect.display.volume["USqt"]
    Convect.display.volume["U.S.qt"][2]="U.S. qt"
 
Convect.display.volume["U.S.pt"]=Convect.display.volume["USpt"]
    Convect.display.volume["U.S.pt"][2]="U.S. pt"
 
Convect.display.volume["USfloz"]=Convect.display.volume["USoz"]
    Convect.display.volume["USfloz"][2]="US fl oz"
 
Convect.display.volume["U.S.oz"]=Convect.display.volume["USoz"]
    Convect.display.volume["U.S.oz"][2]="US fl oz"
 
Convect.display.volume["U.S.floz"]=Convect.display.volume["USoz"]
    Convect.display.volume["U.S.floz"][2]="U.S. fl oz"
 
Convect.display.volume["U.S.drybbl"]=Convect.display.volume["USdrybbl"]
    Convect.display.volume["U.S.drybbl"][2]="U.S. dry bbl"
 
Convect.display.volume["U.S.bsh"]=Convect.display.volume["USbsh"]
    Convect.display.volume["U.S.bsh"][2]="U.S. bsh"
 
Convect.display.volume["U.S.bu"]=Convect.display.volume["USbu"]
    Convect.display.volume["U.S.bu"][2]="U.S. bu"
 
Convect.display.volume["U.S.drygal"]=Convect.display.volume["USdrygal"]
    Convect.display.volume["U.S.drygal"][2]="U.S. dry gal"
 
Convect.display.volume["U.S.dryqt"]=Convect.display.volume["USdryqt"]
    Convect.display.volume["U.S.dryqt"][2]="U.S. dry qt"
 
Convect.display.volume["U.S.drypt"]=Convect.display.volume["USdrypt"]
    Convect.display.volume["U.S.drypt"][2]="U.S. dry pt"
 
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
Convect.display.speed["foot/s"]=Convect.display.speed["ft/s"]
Convect.display.speed["kn"]=Convect.display.speed["knot"]
 
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
Convect.display.force["��N"]=Convect.display.force["uN"]
Convect.display.force["dyne"]=Convect.display.force["dyn"]
Convect.display.force["tf"]={"����","tf"}
Convect.display.force["kgf"]={"ǧ����","kgf"}
Convect.display.force["gf"]={"����","gf"}
Convect.display.force["mgf"]={"������","mgf"}
Convect.display.force["LTf"]={"������","LTf"}
Convect.display.force["STf"]={"�̶���","STf"}
Convect.display.force["lbf"]={"����","lbf"}
Convect.display.force["grf"]={"������","grf"}
 
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
Convect.display.energy["��J"]=Convect.display.energy["uj"]
Convect.display.energy["TW.h"]={"̫��ʱ","TW��h"}
Convect.display.energy["GW.h"]={"����ʱ","TW��h"}
Convect.display.energy["MW.h"]={"����ʱ","TW��h"}
Convect.display.energy["kW.h"]={"ǧ��ʱ","TW��h"}
Convect.display.energy["W.h"]={"��ʱ","TW��h"}
Convect.display.energy["ftlb-f"]={"Ӣ�߰���","ft��lb<sub>f</sub>"}
Convect.display.energy["inbl-f"]={"Ӣ�߰���","in��lb<sub>f</sub>"}
Convect.display.energy["inoz-f"]={"Ӣ���˾��","in��oz<sub>f</sub>"}
Convect.display.energy["BTU"]={"Ӣ�ȵ�λ","BTU"}
Convect.display.energy["GtonTNT"]={"����TNT����","GtonTNT"}
Convect.display.energy["MtonTNT"]={"�׶�TNT����","MtonTNT"}
Convect.display.energy["ktonTNT"]={"ǧ��TNT����","ktonTNT"}
Convect.display.energy["tonTNT"]={"��TNT����","tonTNT"}
Convect.display.energy["cufootnaturalgas"]={"����Ӣ����Ȼ������","cubicfoot of naturalgas"}
Convect.display.energy["Latm"]=Convect.display.energy["latm"]
Convect.display.energy["usgalatm"]=Convect.display.energy["USgalatm"]
Convect.display.energy["U.S.galatm"]={"���Ƽ���-����ѹ","U.S. gal��atm"}
 
--�¶�
Convect_Date.display.temperature={
                                    --���ʵ�λ��
                                    ["K"]={"������","K"},
                                    ["C"]={"���϶�","��C"},
                                    --Ӣ�ƺ���������
                                    ["R"]={"���϶�","��R"},
                                    ["F"]={"���϶�","��F"}
                                  }
Convect.display.temperature["��C"]=Convect.display.temperature["C"]
Convect.display.temperature["��R"]=Convect.display.temperature["R"]
Convect.display.temperature["��F"]=Convect.display.temperature["F"]
 
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
Convect.display.mass["��g"]=Convect.display.mass["ug"]
Convect.display.mass["MT"]=Convect.display.mass["t"]
Convect.display.mass["long ton"]=Convect.display.mass["LT"]
Convect.display.mass["short ton"]=Convect.display.mass["ST"]
Convect.display.mass["dram"]={"dram",nil}
 
--����
Convect_Date.display.torque={
                                --���ʵ�λ��
                                ["Nm"]={"ţ����","N��m"},
                                --�ǹ��ʵ�λ��
                                ["kgm"]={"ǧ����","kg��m"},
                                --Ӣ�ƺ���������
                                ["ftlb"]={"Ӣ�߰���","ft��lb"}
                             }
Convect.display.torque["kgf.m"]={"ǧ������","kgf��m"}
Convect.display.torque["lbfft"]={"����Ӣ��","lbf��ft"}
 
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