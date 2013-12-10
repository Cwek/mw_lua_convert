local Convect={}

--组名
local Convect["group_name"]={"length","area","volume","speed","force","energy","temperature","mass","torque"}
--基准单位
local Convect["baseunit"]={"m","m2","m3","m/s","N","J","K","kg","Nm"}
--基础数据
local Convect_Date=mw.loadData("模块:沙盒/cwek/Convert/data")

--温度，基准为K
--[0]为目标转基准，[1]为基准转目标
--从data.lua移入
Convect_Date_of_temperature.value.temperature={
                                 --国际单位制
                                 ["K"]={function(input) return 1*input end,function(input) return 1*input end},
                                 ["C"]={function(input) return (input+273.15) end ,function(input) return input-273.15 end},
                                 --英制和美国常用
                                 ["R"]={function(input) return (input/1.8) end,function(input) return input*1.8 end},
                                 ["F"]={function(input) return ((input+459.67)/1.8) end,function(input) return input*1.8-459.67 end}
                                 }
Convect_Date_of_temperature.value.temperature["°C"]=Convect_Date_of_temperature.value.temperature["C"]
Convect_Date_of_temperature.value.temperature["°R"]=Convect_Date_of_temperature.value.temperature["R"]
Convect_Date_of_temperature.value.temperature["°F"]=Convect_Date_of_temperature.value.temperature["F"]
Convect["temperature_unit"]={"K","C","R","F","°C","°R","°F"}
----


--特别内容--
--支持2值算单值的单位（组合输入单位）
local Convect["input_together"]={
                            ["ft"]={{"ft","in"}},
                            ["st"]={{"st","lb"}},
                            ["lb"]={{"lb","oz"}}
                            }
--支持组合输出单位的
--{单位={允许的单位,...},...}
local Convect["output_together"]={
                            --长度
                            ["km"]={"mi"},
                            ["m"]={"ft","ftin"},
                            ["cm"]={"in"},
                            ["mm"]={"in"},
                            ["mi"]={"km"},
                            ["ft"]={"m"},
                            ["in"]={"cm","mm"},
                            --面积
                            ["km2"]={"sqmi"},
                            ["m2"]={"sqft"},
                            ["cm2"]={"sqin"},
                            ["mm2"]={"sqin"},
                            ["sqmi"]={"km2"},
                            ["sqft"]={"m2"},
                            ["sqfoot"]={"m2"},
                            ["sqin"]={"cm2"},
                            --体积
                            ["l"]={"impgal","USgal","U.S.gal","USdrygal","U.S.drygal"},
                            ["L"]={"impgal","USgal","U.S.gal","USdrygal","U.S.drygal"},
                            ["ml"]={"impoz","USoz","U.S.oz"},
                            ["mL"]={"impoz","USoz","U.S.oz"},
                            ["impgal"]={"l","L","USgal","U.S.gal","USdrygal","U.S.drygal"},
                            ["impoz"]={"USoz","U.S.oz","ml","mL"},
                            ["USgal"]={"l","L","impgal"},
                            ["U.S.gal"]={"l","L","impgal"},
                            ["USoz"]="ml","mL","impoz",
                            ["U.S.oz"]="ml","mL","impoz",
                            ["USdrygal"]={"l","L","impgal"},
                            ["U.S.drygal"]={"l","L","impgal"},
                            --速度
                            ["m/s"]={"ft/s","foot/s"},
                            ["km/h"]={"mph"},
                            ["mph"]={"km/h","kn"},
                            ["ft/s"]={"m/s"},
                            ["kn"]={"mph"},
                            --力量
                            ["GN"]={"LT-f","LTf","ST-f","STf"},
                            ["MN"]={"LT-f","LTf","ST-f","STf"},
                            ["kN"]={"LT-f","LTf","ST-f","STf"},
                            ["N"]={"lb-f","lbf","oz-f","ozf"},
                            ["mN"]={"oz-f","ozf","gr-f","grf"},
                            ["μN"]={"gr-f","grf"},
                            ["uN"]={"gr-f","grf"},
                            ["nN"]={"gr-f","grf"},
                            ["LT-f"]={"ST-f"},
                            ["LTf"]={"STf"},
                            ["ST-f"]={"LT-f"},
                            ["STf"]={"LTf"},
                            --能量

                            --温度
                            ["K"]={"°C","°R","°F","C","R","F"},
                            ["°C"]={"K","°R","°F","R","F"},
                            ["C"]={"K","°R","°F","R","F"},
                            ["°R"]={"K","°C","°F","C","F"},
                            ["R"]={"K","°C","°F","C","F"},
                            ["°F"]={"K","°C","°R","C","R"},
                            ["F"]={"K","°C","°R","C","R"},
                            --质量
                            ["kg"]={"lb","st"},
                            ["g"]={"oz"},
                            ["mg"]={"gr"},
                            ["t"]={"LT","ST"},
                            ["MT"]={"LT","ST"},
                            ["LT"]={"t","MT","ST"},
                            ["ST"]={"t","MT","ST"},
                            ["st"]={"kg","lb"},
                            ["lb"]={"kg","st"},
                            ["oz"]={"g"},
                            --力矩
                            ["Nm"]={"lbft","lbfft"}
}
--温度差处理
local Convect.temperature_range={"C-change","F-change"}

--2+单元修饰词
local Convect.range_embellish={
                                ["to"]="到",
                                ["and"]="和",
                                ["or"]="或",
                                ["to(-)"]="到",
                                ["+/-"]="±",
                                ["x"]="到"
                                ["-"]="-"
                                }

--[[
    从方法开始
--]]
    --[[
        单位查找方法
    --]]
    --判断是否是温度单位
    --@param unit:输入单位名
    --@return false|true
    function Convect.is_temperature_unit(unit)
        for v in Convect.temperature_unit do
            if v==unit then
                return true
            end
        end
        return false
    end

    --获得温度的换算器
    --@param unit:输入的温度单位名
    --@return 温度单位的换算函数数组
    function Convect.get_temperature_unit_convect(unit)
        return Convect_Date_of_temperature.value.temperature[unit]
    end

    --单个单位检查工具
    --@param unit:输入单位名
    --@return <单位所属组名>,[false|true]
    function Convect.unit_check(unit)
        local flag=false
        local group=nil

        if(tonumber(unit)~=nil)then
            return group,flag
        end

        for group_name in Convect.group_name do
            for unit_name in Convect_Date.value[group_name] do
                if unit_name==unit then
                    group=group_name
                    flag=true

                    return group,flag
                end
            end
        end

        return group,flag
    end

    --单位转换值查找
    --@param group:单位所属组
    --@param unit:输入单位名
    --@return [值（非温度的换算值）|函数数组（温度的换算函数）]
    function Convect.unit_convect_value(group,unit)
        if group=="temperature" and Convect.is_temperature_unit(unit) then
            return Convect.get_temperature_unit_convect(unit)--数组
        else
            return Convect_Date.value[group][unit]--数
        end
    end

    --检查输入的两个单位是否是组合输入单位
    --@param unitA:第一个输入单位
    --@param unitB:第二个输入单位
    --@return false|true
    function Convect.is_input_together(unitA,unitB)
        for k1,v1 in pairs(Convect.input_together) do
            if k1==unitA then
                for k2,v2 in pairs(k1) do
                    if k2==unitB then
                        return true
                    end
                end
            end
        end
        return false
    end

    --检查输入的字符串是否输出组合单位
    --@param input:输入的字符串
    --@return [false|true,<第一个单位>,<第二个单位>]
    function Convect.is_out_together(input)
        local unitA,unitB=string.find(input,"(%a+)%s(%a+)")
        local groupA,flagA=Convect.unit_check(unitA)
        local groupB,flagB=Convect.unit_check(unitB)

        if (flagA and flagB) and groupA==groupB then
            return true,unitA,unitB
        else
            return false
        end
    end
    
    --根据组查阅组的基准单位
    --@param group:单位组名
    --@return [<基准单位名>|""]
    function Convert.base_unit(group)
        for k,v in pairs(Convert.group_name) do
            if v==group then
                return Convert.baseunit[k]
            end
        end

        return ""
    end


    --[[
        构造类方法
    --]]
    --修饰词确认和查找对应
    --@param input:输入检查字符串
    --@return [原字符串|对应的修饰词],[false|true]
    function Convert.embellish(input)
        for k,v in pairs(Convect.range_embellish) do
            if k==input then
                return Convect.range_embellish[k],true
            end
        end

        return input,false
    end
    
    --单位链接值查找
    --@param group:单位组名
    --@param unit:单位名
    --@return [false|<单位的链接值>]
    function Convert.link_finder__(group,unit)
        for k,v in pairs(Convect_Date.link[group]) do
            local linkname=k
            for t in v do
                if unit==t then
                    return linkname
                end
            end
        end
        return false
    end
    
    --单位链接值建造
    --@param flag:显示链接标记旗
    --@param group:单位组名
    --@param unit:单位名
    --@param display:显示值
    --@return <处理好的字符串（链接模式或纯文本）>
    function Convert.link_builder(flag,group,unit,display)
        local code=""
        local t=link_finder(group,unit)

        if(flag and t~=false)then
            return code="[["..t.."|"..display.."]]"
        else
            return code=display
        end
    end
    
    --单位显示值建造（中文全称或缩名）
    --@param group:单位组名 
    --@param unit:单位名
    --@param flag:显示全程或缩名标记旗
    --@return <处理好的字符串（全名或缩名）>
    function Convert.display_builder(group,unit,flag)
        local code=""
        local t_arr=Convect_Date.display[group][unit]

        if((not flag) or t_arr[2]~=nil)then
           return t_arr[1]--缩名
        else
           return t_arr[2]--全名
        end
    end
    
    --取整
    --@param input:输入值
    --@param sigfig:取整数
    --@return <处理数>
    function Convert.sigfig_func(input,sigfig)
        local t,_=math.modf(input*math.pow(10,sigfig)+0.5)

        if sigfig<0 then
            return (string.format("%."..math.abs(sigfig).."f",(t/math.pow(10,sigfig))))
        else
            return (t/math.pow(10,sigfig))
        end
    end
    
    --取5整
    --@param input:输入值
    --@return <处理数>
    function Convert.sigfig5_func(input)
        local t=Convert.sigfig_func(input,0)
        local x=(math.fmod(t,10))
        if(x<2.5)then
            return t-x
        elseif(x>=2.5 and x<5)then
            return t+(5-x)
        elseif(x>=5 and x<7.5)then
            return t-(x-5)
        elseif(x>=7.5) then
            return t+(10-x)
        end
    end
    
    --转换参数构造函数
    --@param group:单位组名
    --@param in_unit:输入单位
    --@param out_unit:输出单位
    --@return <方法（用于转换方法）>
    function Convert.convert_builder(group,in_unit,out_unit)
        local a_t
        local b_t
        
        if Convect.is_temperature_unit(in_unit) and Convect.is_temperature_unit(out_unit)then
            a_t=Convect.get_temperature_unit_convect(in_unit)
            a_t=Convect.get_temperature_unit_convect(out_unit)
        else
            a_t=Convect_Date.value[group][in_unit]
            b_t=Convect_Date.value[group][out_unit]
        end
        
        if type(a_t)=="number" and type(b_t)=="number" then--如果是普通数（非温度类）
            local a,b=a_t,b_t
            return function(input) return input*a/b end
        else--温度类的处理
            local a_K,K_b=a_t[1],a_t[2]
            return function(input) return K_b(a_K(input)) end
        end
    end


--[[
    主方法开始
--]]
--传入参数初始化
--@param frame:mw.frame
--@return <数组（负载）>
function Convect.init__(frame)
    local args_from_template=frame:getParent().args

    local args={}--准备载具

    for k,v in pairs(args_from_template) do
        if(tonumber(k)~=nil)then
            args[tonumber(k)]=v
        else
            args[k]=v
        end
    end

    return args
end

function Convect.cheak__(args)--整理参数，确定处理数
    --根据索引参数组的数字排序判断处理单元数
    local t_processCount=0
    local t_mark=0
    local t_unit=nil
    local t_unit_group=nil

    --if t_unit





    if tonumber(args.args[1])~=nil--处理1个单元
        t_processCount=1
    elseif tonumber(args.args[3])~=nil--处理2个单元
        t_processCount=2

        --从特殊2转1输入中找出匹配项
        local find_in_inputSepceil=function(input1,input2)
            for k,v in pairs(input_sepceil) do
                if k==input1 then
                    for t in v do
                        if v==input2 then
                            return true
                        end
                    end
                end
            end
            return false
        end
        if find_in_inputSepceil(args.args[2],args.args[4]) then--如果索引2和索引4在2转1输入中，改回处理1个单元
            args["2in1"]=true
            t_processCount=1
        else
            args["2in1"]=false
        end

        --温度转换检测
        local find_temperatureChange=function(input1)
            for v in Convect.temperature_range do
                if input1==v then
                    return true
                end
            end
            return false
        end
        if find_temperatureChange(args.args[2]) then--如果索引2有特定的温度转换参数，改回处理1个单元
            t_processCount=1
            args["t_c"]=true
        else
            args["t_c"]=false
        end
    elseif tonumber(args.args[5])~=nil and args["processCount"]==3 then--处理3个单元
        t_processCount=3
    elseif tonumber(args.args[7])~=nil and args["processCount"]==4 then--处理4个单元
        t_processCount=4
    end
    args["processCount"]=t_processCount
    --处理单元判断done

    --处理sigfig，disp相关的基数
    local base=0--对应输出单位位置的基值
    if args["processCount"]==1 then
        base=3
    elseif args["processCount"]==2 then
        base=5
    elseif args["processCount"]==3 then
        base=7
    elseif args["processCount"]==4 then
        base=9
    end
        if(args["processCount"]==1 and string.find(args.args[base]," "))then--检查是否含有复合输出，以判断是否带有空格
            --将可能是组合单位输出的相应参数进行分离
            local t_out={}
            local i=0
            while true do--
                x,y=string.find(args.args[base]," ",i)
                if(x==nil or y==nil)then
                    table.insert(t_out,string.sub(args.args[base],i,#args.args[base]))
                    break
                else
                    table.insert(t_out,string.sub(args.args[base],i,x-1))
                    i=y+1
                end
            end

            local a,b=t_out[1],t_out[2]--读取两个分离单位
            local flag=false

            for k,v in pairs(Convect.output_together) do--进行对比确认
                if(k==a)then
                    for t in v do
                        if(b==t)then
                            --args["output_together"]=true
                            args["out_unit_instead"]=t_out
                            flag=true
                            break
                        end
                    end
                    break
                end
            end
            if(not flag)then--如果不是组合单位
                args.args[base]=a--直接修改参数，改为前一个单位
            end

        end
        --args.args

        --判断有没省略输出单位
        local _,unit_flag=Convect.unit_check__(args.args[base])
        if out_unit_flag then
            args["out_unit_miss"]=false
            base=base+1
        else
            args["out_unit_miss"]=false
            if(args["t_c"])then
                args["out_unit_miss"]=true
            end
        end
        --处理sigfig
        local t_sigfig=args["sigfig"]
        if tonumber(args.args[base])~=nil and (not args["have_sigfig"])then
            t_sigfig=tonumber(args.args[base])
            base=base+1
        elseif args["have_sigfig"] then
            t_sigfig=args["sigfig"]
        end
        args["sigfig"]=t_sigfig
        --disp=x的处理
        if args["disp"]=="x" then
            args["modelX_a"]=(args.args[base]~=nil and args.args[base])or ""
            args["modelX_b"]=(args.args[base+1]~=nil and args.args[base+1])or ""
        end
    --处理完毕

    --处理disp参数
    local disp_b_model="%s[%s]"
    args["model"]=disp_b_model


    local switch_disp={}
    switch_disp["b"]=       function()
                                --args["model"]=disp_b_model
                            end
    switch_disp["comma"]=   function()
                                args["model"]="%s，%s"
                            end
    switch_disp["output only"]=function()
                                --args["model"]=disp_b_model
                                args["outputOnly"]=true
                            end
    switch_disp["output number only"]=function()
                                --args["model"]=disp_b_model
                                args["outputOnly"]=true
                                args["out_only_val"]=true
                            end
    switch_disp["flip"]=    function()
                                --args["model"]=disp_b_model
                                args["filp"]=true
                            end
    switch_disp["unit"]=    function()
                                args["unitonly"]=true
                            end
    switch_disp["5"]=       function()
                                args["sigfig5"]=true
                            end
    switch_disp["x"]=       function()
                                args["model"]="%s"..args["modelX_a"].."%s"..args["modelX_b"]
                            end
    swtich_disp["table"]=   function()
                                args["table"]=true
                                local center="align=\"center\" "
                                local issort=""

                                if args["sortable"] then
                                    issort="data-sort-value=\"%s\" "
                                end
                                args["model"]=center..issort.."|%s".."|"..center.."|%s"
                            end
    swtich_disp[args["disp"]]()

    return args
end
--[[
转换处理流程概况
in_value[x](in_unit[x])：获得输入值，输入单位并计算输出单位（获得或根据单位所属组获得基准单位）
         |             ：计算转换公式
        \|/
function_convert[x]    ：计算值
         |
        \|/
out_value[x](out_unit[1])：计算出输出值
         |
        \|/
out_value_sum：合并部分输出值
--]]
--[[
args可能传入数据：
    init生成的：
        [args]:传入的索引参数-table
        [processCount]<3,4或nil>:要处理的单元数-number
        [link_in],[link_out]:控制是否生成单位链接-bool
        [display_shortin],[display_shortout],[display_valonly]:控制单位显示生成-bool
        [sigfig]:有效位数-number
        [disp]:传入的disp-string
        [sortable]:传入的sortable-bool
        [have_sigfig]：存在sigfig-bool
    check生成的：
        [2in1]:2转1标记-bool
        [t_c]:温度范围转换标记-bool
        [out_unit_miss]:缺少输出单位标记-bool
        [modelX_a],[modelX_b]:disp=x的标记模型-string
        [model]:输出的模型-string
        [outputOnly]:控制只包含输出标记-bool,nil
        [out_only_val]:控制只包含输出值标记-bool,nil
        [filp]:翻转输入输出位置标记-bool.nil
        [unitonly]:只包含单位输出标记-bool,nil
        [sigfig5]:整5取整标记-bool,nil
        [out_unit_instead]:组合输出单位，只限处理1个单元时-table
--]]
function Convert.bind_1__(args)
    local out=""

    local in_value={}
    local out_value={}

    local in_unit={}
    local out_unit={}
    local group_name=""
    local function_convert={}

    --转换参数输入整理
    table.insert(in_value,args.args[1])
    table.insert(in_unit,args.args[2])
    group_name,_=Convert.unit_Convert_value(in_unit[1])
    local baseunit=Convert.base_unit__(group_name)
    table.insert(out_unit,(args.args[3] and args.args[3] )or baseunit)
    if(args["2in1"])then--2转1的输入
        table.insert(in_value,args.args[1])
        table.insert(in_unit,args.args[2])
        --table.insert(out_unit,(args.args[3] and args.args[3] )or baseunit)
    end
    if(args["t_c"])then--温度范围转换
        if in_unit[1]=="C-change" then
            in_unit[1]="C"
            out_unit[1]="F"
        elseif in_unit[1]=="F-change" then
            in_unit[1]="F"
            out_unit[1]="C"
        end
        group_name="temperature"
    end
    if(args["unitonly"])then--只输入单位显示输出,处理args["unitonly"]
        out=out..table.concat(in_unit,"，")
        return out
    end

    if(not args["out_unit_instead"])then
        for v in in_unit do--获得转换参数公式<---------<------
            table.insert(function_convert,Convert.convert(v,out_unit[1]))
        end

        for k,v in pairs(in_value) do--转换中和sigfig的处理和args["sigfig5"]
            local t_number=function_convert[k](v)

            t_number=Convert.sigfig_func(t_number,args["sigfig"])
            if(args["sigfig5"])then t_number=Convert.sigfig5_func(tonumber(t_number)).."" end
            table.insert(out_value,t_number,k)
        end
        local sum_out_value=0
        for v in out_value do--汇总
            sum_out_value=sum_out_value+v
        end
    else
        out_unit=args["out_unit_instead"]--args["out_unit_instead"]的转换生成
        for v in out_unit do
            table.insert(function_convert,Convert.convert(in_unit[1],v))
        end

        for k,v in pairs(function_convert) do
            local t_number=v(in_value[1])

            t_number=Convert.sigfig_func(t_number,args["sigfig"])
            if(args["sigfig5"])then t_number=Convert.sigfig5_func(tonumber(t_number)).."" end
            table.insert(out_value,t_number,k)
        end
    end

    local in_out,out_out="",""

    --输入显示处理，并处理连个控制参数
    if(not args["outputOnly"])then--args["outputOnly"]
        for k,v in pairs(in_value)do
            in_out=in_out..v..Convert.link_builder__
                (args["link_in"],group_name,in_unit[k],
                    (args["display_valonly"] and "") or --args[display_valonly]
                    Convert.display_builder__
                    (group_name,in_unit[k],["display_shortin"])
                )
        end
    end

    --输出显示处理
    if not args["out_unit_instead"] then
        out_out=out_out..sum_out_value

        if args["out_only_val"] then--args["out_only_val"]
        out_out=out_out..Convert.link_builder__
                (args["link_out"],group_name,in_unit[k],
                    (args["display_valonly"] and "") or --args[display_valonly]
                    Convert.display_builder__
                    (group_name,in_unit[k],["display_shortout"])
                )
    else--<<<<<<<<<<
        if args["out_only_val"] then--args["out_only_val"]
        out_out=out_out..Convert.link_builder__
                (args["link_out"],group_name,in_unit[k],
                    (args["display_valonly"] and "") or --args[display_valonly]
                    Convert.display_builder__
                    (group_name,in_unit[k],["display_shortout"])
                )

    end

    local a,b=in_out,out_out
    if args["filp"] then b,a=in_out,out_out--[filp]

    if(args["sortable"])
        out=out..string.format(args["model"],a,a,b)
    else
        out=out..string.format(args["model"],a,b)
    return out
end

function Convert.bind_2__(args)
end

function Convert.bind_3__(args)
end

function Convert.bind_4__(args)
end

function Convert.main(frame)
    local args=Convert.init__(frame)

    args=Convert.cheak__(args)

    local switch={}
    switch[1]=Convert.bind_1__
    switch[2]=Convert.bind_2__
    switch[3]=Convert.bind_3__
    switch[4]=Convert.bind_4__

    return switch[args["processCount"]](args)
end

return Convert
