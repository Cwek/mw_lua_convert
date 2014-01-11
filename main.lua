local Convert={}

--组名
Convert["group_name"]={"length","area","volume","speed","force","energy","temperature","mass","torque"}
--基准单位
Convert["baseunit"]={"m","m2","m3","m/s","N","J","K","kg","Nm"}
--基础数据
-- local Convert_Date=dofile("D:\\documents\\Github\\mw_lua_convert\\data.lua")
-- local Convert_Date=dofile("D:\\GitHub\\mw_lua_convert\\data.lua")
local Convert_Date=mw.loadData("模块:沙盒/cwek/Convert/data")

--温度，基准为K
--[0]为目标转基准，[1]为基准转目标
--从data.lua移入
local Convert_Date_of_temperature={["value"]={["temperature"]={}}}
Convert_Date_of_temperature.value.temperature={
                                 --国际单位制
                                 ["K"]={function(input) return 1*input end,function(input) return 1*input end},
                                 ["C"]={function(input) return (input+273.15) end ,function(input) return input-273.15 end},
                                 --英制和美国常用
                                 ["R"]={function(input) return (input/1.8) end,function(input) return input*1.8 end},
                                 ["F"]={function(input) return ((input+459.67)/1.8) end,function(input) return input*1.8-459.67 end}
                                 }
Convert_Date_of_temperature.value.temperature["°C"]=Convert_Date_of_temperature.value.temperature["C"]
Convert_Date_of_temperature.value.temperature["°R"]=Convert_Date_of_temperature.value.temperature["R"]
Convert_Date_of_temperature.value.temperature["°F"]=Convert_Date_of_temperature.value.temperature["F"]
Convert["temperature_unit"]={"K","C","R","F","°C","°R","°F"}
----


--特别内容--
--支持2值算单值的单位（组合输入单位）
--{第一个单位={{第一个单位,第二个单位},...},...}
Convert["input_together"]={
                            ["ft"]={{"ft","in"}},
                            ["st"]={{"st","lb"}},
                            ["lb"]={{"lb","oz"}}
                            }
--支持组合输出单位的
--{单位={允许的单位,...},...}
Convert["output_together"]={
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
Convert["temperature_range"]={"C-change","F-change"}

--2+单元修饰词
Convert["range_embellish"]={
                                ["to"]="到",
                                ["and"]="和",
                                ["or"]="或",
                                ["to(-)"]="到",
                                ["+/-"]="±",
                                ["x"]="到",
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
    function Convert.is_temperature_unit(unit)
        for k,v in pairs(Convert_Date_of_temperature.value.temperature) do
            if k==unit then
                return true
            end
        end
        return false
    end

    --获得温度的换算器
    --@param unit:输入的温度单位名
    --@return 温度单位的换算函数数组
    function Convert.get_temperature_unit_Convert(unit)
        return Convert_Date_of_temperature.value.temperature[unit]
    end

    --单个单位检查工具
    --@param unit:输入单位名
    --@return <单位所属组名>,[false|true]
    function Convert.unit_check(unit)
        local flag=false
        local group=nil

        if(tonumber(unit)~=nil)then
            return group,flag
        end

        for k,group_name in pairs(Convert.group_name) do
            if group_name=="temperature" then--针对温度
                if Convert.is_temperature_unit(unit) then
                    return "temperature",true
                end
            else
                for unit_name,v in pairs(Convert_Date.value[group_name]) do--通常，其他
                    if unit_name==unit then
                        group=group_name
                        flag=true

                        return group,flag
                    end
                end
            end
        end

        return group,flag
    end

    --单位转换值查找
    --@param group:单位所属组
    --@param unit:输入单位名
    --@return [值（非温度的换算值）|函数数组（温度的换算函数）]
    function Convert.unit_Convert_value(group,unit)
        if group=="temperature" and Convert.is_temperature_unit(unit) then
            return Convert.get_temperature_unit_Convert(unit)--数组
        else
            return Convert_Date.value[group][unit]--数
        end
    end

    --检查输入的两个单位是否是组合输入单位
    --@param unitA:第一个输入单位
    --@param unitB:第二个输入单位
    --@return false|true
    function Convert.is_input_together(unitA,unitB)
        for k1,v1 in pairs(Convert.input_together) do
            if k1==unitA then
                for k2,v2 in pairs(v1) do
                    if (v2[1]==unitA and v2[2]==unitB) then
                        return true
                    end
                end
            end
        end
        return false
    end

    --检查输入的字符串是否输出组合单位
    --@param input:输入的字符串
    --@return [false,nil,nil|true,<第一个单位>,<第二个单位>]
    function Convert.is_out_together(input)
        local _,_,unitA,unitB=string.find(input,"(%a+)%s(%a+)")
        local groupA,flagA=Convert.unit_check(unitA)
        local groupB,flagB=Convert.unit_check(unitB)

        if (flagA and flagB) and groupA==groupB then
            return true,unitA,unitB
        else
            return false,nil,nil
        end
    end

    --根据组查阅组的基准单位
    --@param group:单位组名
    --@return [<基准单位名>|nil]
    function Convert.base_unit(group)
        for k,v in pairs(Convert.group_name) do
            if v==group then
                return Convert.baseunit[k]
            end
        end

        return nil
    end


    --[[
        构造类方法
    --]]
    --修饰词确认和查找对应
    --@param input:输入检查字符串
    --@return [原字符串|对应的修饰词],[false|true]
    function Convert.embellish(input)
        for k,v in pairs(Convert.range_embellish) do
            if k==input then
                return Convert.range_embellish[k],true
            end
        end

        return input,false
    end

    --单位链接值查找
    --@param group:单位组名
    --@param unit:单位名
    --@return [false|<单位的链接值>]
    function Convert.link_finder(group,unit)
        for k,v in pairs(Convert_Date.link[group]) do
            local linkname=k
            for k,t in pairs(v) do
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
        local code
        local t=Convert.link_finder(group,unit)

        if(flag and t~=false)then
            code="[["..t.."|"..display.."]]"
        else
            code=display
        end
        return code
    end

    --单位显示值建造（中文全称或缩名）
    --@param group:单位组名
    --@param unit:单位名
    --@param flag:显示全程或缩名标记旗<true为缩名，false为全名>
    --@return <处理好的字符串（全名或缩名）>
    function Convert.display_builder(group,unit,flag)
        local t_arr=Convert_Date.display[group][unit]

        if(not flag) or (flag and t_arr[2]==nil)then
           return t_arr[1]--全名
        else
           return t_arr[2]--缩名
        end
    end

    --取整
    --@param input:输入值
    --@param sigfig:取整数
    --@return <处理数>
    function Convert.sigfig_func(input,sigfig)
        local t,_=math.modf(input*math.pow(10,sigfig)+0.5)
		local s=t/math.pow(10,sigfig)
        if sigfig<0 then
            return string.format("%."..math.abs(sigfig).."d",s)
        else
            return string.format("%."..sigfig.."f",s)
        end
    end

    --取5整
    --@param input:输入值
    --@return <处理数>
    function Convert.sigfig5_func(input)
        local t=tonumber(Convert.sigfig_func(input,0))
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

        if Convert.is_temperature_unit(in_unit) and Convert.is_temperature_unit(out_unit)then
            a_t=Convert.get_temperature_unit_Convert(in_unit)
            b_t=Convert.get_temperature_unit_Convert(out_unit)
        else
            a_t=Convert_Date.value[group][in_unit]
            b_t=Convert_Date.value[group][out_unit]
        end

        if type(a_t)=="number" and type(b_t)=="number" then--如果是普通数（非温度类）
            local a,b=a_t,b_t
            return function(input) return input*a/b end
        else--温度类的处理
            local a_K,K_b=a_t[1],b_t[2]
            return function(input) return K_b(a_K(input)) end
        end
    end


--[[
    主方法开始
--]]
    --传入参数初始化
    --@param frame:mw.frame
    --@return <数组（负载）>
    -- function Convert.init(args)
        -- local args_from_template=args
    function Convert.init(frame)
        local args_from_template=frame:getParent().args

        local args={}--准备载具

        for k,v in pairs(args_from_template) do
            if(tonumber(k)~=nil)then
                args[tonumber(k)]=v
            else
                args[k]=v
            end
        end

        if not args["lk"] then--设定lk默认值
            args["lk"]="off"
        end

        if not args["abbr"] then--设定abbr默认值
            args["abbr"]="off"
        end

        if not args["disp"] then--设定disp默认值
            args["disp"]="b"
        end

        if not args["sigfig"] then--设定sigfig默认值
            args["sigfig"]=3
        end

        return args
    end

    --整理参数，确定处理数
    function Convert.cheak(args)
        --根据索引参数组的数字排序判断处理单元数
        local t_processCount=0
        local t_mark=0
        --local t_unit=nil
        --local t_unit_group=nil
        local groupA,flagA
        local groupB,flagB

        --[[
            检查是否1个处理单元
        --]]
        t_mark=2--锁定检查索引2
        t_processCount=1
        for k,v in pairs(Convert["temperature_range"]) do--温度间转换
            if v==args[t_mark] then
                --t_processCount=1
                args["processCount"]=t_processCount
                args["group"]="temperature"
                args["temperature_range"]=v
                args["mark"]=t_mark
                args["last_mark"]=t_mark--离索引参数有效位最后前一位

                if tonumber(args[t_mark+1])~=nil then--使用索引参数标记有效位，记录
                     args["sigfig_inindex"]=tonumber(args[t_mark+1])
                end

                print("TR ok")
                return args
            end
        end
        print("TR miss")

        groupA,flagA=Convert.unit_check(args[t_mark]);
        if flagA==true then--确认第一个是单位，以区分联系词（2个处理单元）
            --确认是不是组合输入（索引参数4是不是同组单位）
            if Convert.is_input_together(args[t_mark],args[t_mark+2])then
                groupB,flagB=Convert.unit_check(args[t_mark+3])
                if groupB==groupA and flagB then
                    args["processCount"]=t_processCount
                    args["group"]=groupA
                    args["inputtogether"]=true
                    args["mark"]=t_mark
                    args["last_mark"]=t_mark+3--离索引参数有效位最后前一位

                    if tonumber(args[t_mark+4])~=nil then--使用索引参数标记有效位，记录
                         args["sigfig_inindex"]=tonumber(args[t_mark+4])
                    end

                    print("IT ok")
                    return args
                else

                end
            end
            print("IT miss")

            --确认是不是组合输出（索引数组3是不是同组单位）
            local out_together_flag,unitA,unitB=Convert.is_out_together(args[t_mark+1])
            if out_together_flag then
                local groupBA,flagBA=Convert.unit_check(unitA)
                local groupBB,flagBB=Convert.unit_check(unitB)
                if (groupBA==groupA and groupBB==groupA) and (flagBA and flagBB) then
                    args["processCount"]=t_processCount
                    args["group"]=groupA
                    args["outputtogether"]={unitA,unitB}
                    args["mark"]=t_mark
                    args["last_mark"]=t_mark+1--离索引参数有效位最后前一位

                    if tonumber(args[t_mark+2])~=nil then--使用索引参数标记有效位，记录
                         args["sigfig_inindex"]=tonumber(args[t_mark+2])
                    end

                    print("OT ok")
                    return args
                else

                end
            end
            print("OT miss")

            --确认是不是普通的1个单元处理（索引数组3）
            groupB,flagB=Convert.unit_check(args[t_mark+1])
            if flagB and groupB==groupA then
                args["processCount"]=t_processCount
                args["group"]=groupA
                args["mark"]=t_mark
                args["last_mark"]=t_mark+1--离索引参数有效位最后前一位

                if tonumber(args[t_mark+2])~=nil then--使用索引参数标记有效位，记录
                     args["sigfig_inindex"]=tonumber(args[t_mark+3])
                end

                print("P1 ok")
                return args
            else

            end
        end
        print("P1 miss")

        local embellish,flag_embellish
        args["embellish"]={}
        --[[
            检查是否2个处理单元
        --]]
        t_mark=4--锁定检查索引4
        t_processCount=2
        embellish,flag_embellish=Convert.embellish(args[t_mark-2])--确认索引数组2是不是修饰词并获得修饰词
        ----if Convert.embellish(args[t_mark-2]) then
        args["embellish"][1]=embellish
        ----end
        --检查索引4和索引5是否是单位，是则确认为2个处理数
        groupA,flagA=Convert.unit_check(args[t_mark])
        groupB,flagB=Convert.unit_check(args[t_mark+1])
        if groupA==groupB and (flagA and flagB) then
            args["processCount"]=t_processCount
            args["group"]=groupA
            args["mark"]=t_mark
            args["last_mark"]=t_mark+1--离索引参数有效位最后前一位

            if tonumber(args[t_mark+2])~=nil then--使用索引参数标记有效位，记录
                 args["sigfig_inindex"]=tonumber(args[t_mark+3])
            end

            print("P2 ok")
            return args
        else

        end
        print("P2 miss")

        --[[
            检查是否3个处理单元
        --]]
        t_mark=6--锁定检查索引4
        t_processCount=3
        embellish,flag_embellish=Convert.embellish(args[t_mark-2])--确认索引数组2是不是修饰词并获得修饰词
        ----if Convert.embellish(args[t_mark-2]) then
        args["embellish"][2]=embellish
        ----end
        --检查索引6和索引7是否是单位，是则确认为2个处理数
        groupA,flagA=Convert.unit_check(args[t_mark])
        groupB,flagB=Convert.unit_check(args[t_mark+1])
        if groupA==groupB and (flagA and flagB) then
            args["processCount"]=t_processCount
            args["group"]=groupA
            args["mark"]=t_mark
            args["last_mark"]=t_mark+1--离索引参数有效位最后前一位

            if tonumber(args[t_mark+2])~=nil then--使用索引参数标记有效位，记录
                 args["sigfig_inindex"]=tonumber(args[t_mark+3])
            end

            print("P3 ok")
            return args
        else

        end
        print("P3 miss")

        --[[
            检查是否4个处理单元
        --]]
        t_mark=8--锁定检查索引6
        t_processCount=4
        embellish,flag_embellish=Convert.embellish(args[t_mark-2])--确认索引数组2是不是修饰词并获得修饰词
        ----if Convert.embellish(args[t_mark-2]) then
        args["embellish"][3]=embellish
        ----end
        --检查索引6和索引7是否是单位，是则确认为2个处理数
        groupA,flagA=Convert.unit_check(args[t_mark])
        groupB,flagB=Convert.unit_check(args[t_mark+1])
        if groupA==groupB and (flagA and flagB) then
            args["processCount"]=t_processCount
            args["group"]=groupA
            args["mark"]=t_mark
            args["last_mark"]=t_mark+1--离索引参数有效位最后前一位

            if tonumber(args[t_mark+2])~=nil then--使用索引参数标记有效位，记录
                args["sigfig_inindex"]=tonumber(args[t_mark+3])
            end

            print("P4 ok")
            return args
        else

        end
        print("ALL miss")

        --结束
        return args
    end


    --[[
        选择并执行对应的转换模式方法
        @param 负载数组
        @return 显示代码
    --]]
    function Convert.select(args)
        local switch={}
        switch[1]=Convert.bind_1
        switch[2]=Convert.bind_2
        switch[3]=Convert.bind_3
        switch[4]=Convert.bind_4
        switch["temperature_range"]=Convert.bind_1_tempRange
        switch["inputtogether"]=Convert.bind_1_intogether
        switch["outputtogether"]=Convert.bind_1_outtogether
        switch["error"]=Convert.bind_error
        local flag=args["processCount"]
        if args["temperature_range"]~=nil then
            flag="temperature_range"
        elseif args["inputtogether"]~=nil then
            flag="inputtogether"
        elseif args["outputtogether"]~=nil then
            flag="outputtogether"
        elseif args["error"]~=nil then
            flag="error"
        end
        return switch[flag](args)
    end

    --[[
        args可能有：
        原生数据,
        必然存在:
            ["processCount"]=<处理单元数>
            ["group"]=<单元组名>
            ["mark"]=第一个单位的起始位标fo
            ["last_mark"]=离（假设的）索引参数有效位最后前一位
        可能存在:
            ["sigfig_inindex"]=通过索引参数传入的有效位数
            (1)["temperature_range"]=温度间转换标记(表明那种转换)
            (1)["inputtogether"]=组合输入标记(true)
            (1)["outputtogether"]=组合输出标记(输出单位数组)
            (2,3,4)["embellish"]=联系词数组
    --]]
    --[[
        处理普通1个处理单元
    --]]
    function Convert.bind_1(args)
        --锁定锚点
        local mark=args["mark"]

        --初始化数值，单位，转换方法
        local in_num,out_num=tonumber(args[mark-1]),0
        local in_unit,out_unit,group_name=args[mark],args[mark+1],args["group"]
        local function_convert=Convert.convert_builder(group_name,in_unit,out_unit)

        --换算中
        out_num=function_convert(in_num)

        --有效位数计算
        local sigfig=0
        if args["sigfig_inindex"]~=nil then
            sigfig=tonumber(args["sigfig_inindex"])
        elseif args["sigfig"] then
            sigfig=tonumber(args["sigfig"])
        end
        local function_sigfig=Convert.sigfig_func
        if args["disp"]=="5" then
            function_sigfig=Convert.sigfig5_func
        end
        out_num=function_sigfig(out_num,sigfig)

        --输出
        --输出准备
        local out

        --读取lk，abbr，disp
        local lk,abbr,disp=args["lk"],args["abbr"],args["disp"]
        local lk_in_flag,lk_out_flag,abbr_in_flag,abbr_out_flag
        local number_only_flag,out_number_only_flag,out_unit_only_flag=false,false,false

        --[[
            lk判断
        --]]
        if lk=="off" then
            lk_in_flag,lk_out_flag=false,false
        elseif lk=="in" then
            lk_in_flag,lk_out_flag=true,false
        elseif lk=="out" then
            lk_in_flag,lk_out_flag=false,true
        elseif lk=="on" then
            lk_in_flag,lk_out_flag=true,true
        end

        --[[
            abbr判断
        --]]
        if abbr=="off" then
            abbr_in_flag,abbr_out_flag=false,false
        elseif abbr=="in" then
            abbr_in_flag,abbr_out_flag=true,false
        elseif abbr=="out" then
            abbr_in_flag,abbr_out_flag=false,true
        elseif abbr=="on" then
            abbr_in_flag,abbr_out_flag=true,true
        elseif abbr=="values" then
            abbr_in_flag,abbr_out_flag=false,false
            number_only_flag=true
        end

        --[[
            生成单位的输出代码
        --]]
        local inunit_code=Convert.link_builder(
                            lk_in_flag,
                            group_name,
                            in_unit,
                            Convert.display_builder(
                                group_name,
                                in_unit,
                                abbr_in_flag
                            )
                        )
        local outunit_code=Convert.link_builder(
                            lk_out_flag,
                            group_name,
                            out_unit,
                            Convert.display_builder(
                                group_name,
                                out_unit,
                                abbr_out_flag
                            )
                        )

        --[[
            disp判断输出
        --]]
        local divisionA,divisionB="（","）"
        if disp=="output only" then
            if number_only_flag then
                inunit_code=""
            end
            in_num=""
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="output number only" then
            inunit_code=""
            in_num=""
            outunit_code=""
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="b" then--disp=b，默认
            divisionA,divisionB="[","]"
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="comma" then--disp=comma
            divisionA,divisionB="，",""
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="x" then --disp=x
            local t_mark=0--存在索引参数有效位数的偏移标记
            if args["sigfig_inindex"]~=nil then--存在则为1
                t_mark=1
            end
            local last_mark=args["last_mark"]
            local t_divisionA,t_divisionB=args[last_mark+t_mark+1],args[last_mark+t_mark+2]--读取倒数最后一到两位（对应disp=x时后两位的位置）
            if t_divsionB==nil then
                t_divsionB=""
            end
            divisionA,divisionB=t_divisionA,t_divisionB

            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="filp" then--disp=filp
            out={out_num,outunit_code,divisionA,in_num,inunit_code,divisionB}

            return table.concat(out)
        elseif disp=="unit" then--disp=unit
            if in_num==1 then
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,false))
            else
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,true))
            end
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="table" then--disp=table
            local temp=""
            if args["sortable"]~=nil then
                --代替调用{{ntsh}}，效果等价
                temp=string.format([[<span style="display:none">%016.6f</span>]],in_num)
            end
            out={"|",temp,in_num,"||",out_num}

            return table.concat(out)
        else
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        end
    end

    --[[
        处理温度间转换1个处理单元
    --]]
    function Convert.bind_1_tempRange(args)
        --锁定锚点
        local mark=args["mark"]

        --初始化数值，单位，转换方法
        local in_num,out_num=tonumber(args[mark-1]),0
        local in_unit,out_unit,group_name=nil,nil,args["group"]
        if args[mark]=="C-change" then--温度转换
            in_unit,out_unit="C","F"
        else
            in_unit,out_unit="F","C"
        end
        local function_convert=Convert.convert_builder(group_name,in_unit,out_unit)

        --换算中
        out_num=function_convert(in_num)

        --有效位数计算
        local sigfig=0
        if args["sigfig_inindex"]~=nil then
            sigfig=tonumber(args["sigfig_inindex"])
        elseif args["sigfig"] then
            sigfig=tonumber(args["sigfig"])
        end
        local function_sigfig=Convert.sigfig_func
        if args["disp"]=="5" then
            function_sigfig=Convert.sigfig5_func
        end
        out_num=function_sigfig(out_num,sigfig)

        --输出
        --输出准备
        local out

        --读取lk，abbr，disp
        local lk,abbr,disp=args["lk"],args["abbr"],args["disp"]
        local lk_in_flag,lk_out_flag,abbr_in_flag,abbr_out_flag
        local number_only_flag,out_number_only_flag,out_unit_only_flag=false,false,false

        --[[
            lk判断
        --]]
        if lk=="off" then
            lk_in_flag,lk_out_flag=false,false
        elseif lk=="in" then
            lk_in_flag,lk_out_flag=true,false
        elseif lk=="out" then
            lk_in_flag,lk_out_flag=false,true
        elseif lk=="on" then
            lk_in_flag,lk_out_flag=true,true
        end

        --[[
            abbr判断
        --]]
        if abbr=="off" then
            abbr_in_flag,abbr_out_flag=false,false
        elseif abbr=="in" then
            abbr_in_flag,abbr_out_flag=true,false
        elseif abbr=="out" then
            abbr_in_flag,abbr_out_flag=false,true
        elseif abbr=="on" then
            abbr_in_flag,abbr_out_flag=true,true
        elseif abbr=="values" then
            abbr_in_flag,abbr_out_flag=false,false
            number_only_flag=true
        end

        --[[
            生成单位的输出代码
        --]]
        local inunit_code=Convert.link_builder(lk_in_flag,group_name,in_unit,Convert.display_builder(group_name,in_unit,abbr_in_flag))
        local outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,abbr_out_flag))

        --[[
            disp判断输出
        --]]
        local divisionA,divisionB="（","）"
        if disp=="output only" then
            if number_only_flag then
                inunit_code=""
            end
            in_num=""
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="output number only" then
            inunit_code=""
            in_num=""
            outunit_code=""
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="b" then--disp=b，默认
            divisionA,divisionB="[","]"
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="comma" then--disp=comma
            divisionA,divisionB="，",""
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="x" then --disp=x
            local t_mark=0--存在索引参数有效位数的偏移标记
            if args["sigfig_inindex"]~=nil then--存在则为1
                t_mark=1
            end
            local last_mark=args["last_mark"]
            local t_divisionA,t_divisionB=args[last_mark+t_mark+1],args[last_mark+t_mark+2]--读取倒数最后一到两位（对应disp=x时后两位的位置）
            if t_divsionB==nil then
                t_divsionB=""
            end
            divisionA,divisionB=t_divisionA,t_divisionB

            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="filp" then
            out={out_num,outunit_code,divisionA,in_num,inunit_code,divisionB}

            return table.concat(out)
        elseif disp=="unit" then
            if in_num==1 then
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,false))
            else
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,true))
            end
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="table" then
            local temp=""
            if args["sortable"]~=nil then
                --代替调用{{ntsh}}，效果等价
                temp=string.format([[<span style="display:none">%016.6f</span>]],in_num)
            end
            out={"|",temp,in_num,"||",out_num}

            return table.concat(out)
        else
            out={in_num,inunit_code,divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        end
    end

    --[[
        处理组合输入1个处理单元
    --]]
    function Convert.bind_1_intogether(args)
        --锁定锚点
        local mark=args["mark"]

        --初始化数值，单位，转换方法
        local in_num,out_num={tonumber(args[mark-1]),tonumber(args[mark+1])},0
        local in_unit,out_unit,group_name={args[mark],args[mark+2]},args[mark+3],args["group"]
        local function_convert={}
        for k,v in pairs(in_unit) do
            function_convert[k]=Convert.convert_builder(group_name,v,out_unit)
        end

        --换算中
        for k,v in pairs(in_num) do
            out_num=out_num+function_convert[k](in_num[k])
        end

        --有效位数计算
        local sigfig=0
        if args["sigfig_inindex"]~=nil then
            sigfig=tonumber(args["sigfig_inindex"])
        elseif args["sigfig"] then
            sigfig=tonumber(args["sigfig"])
        end
        local function_sigfig=Convert.sigfig_func
        if args["disp"]=="5" then
            function_sigfig=Convert.sigfig5_func
        end
        out_num=function_sigfig(out_num,sigfig)

        --输出
        --输出准备
        local out

        --读取lk，abbr，disp
        local lk,abbr,disp=args["lk"],args["abbr"],args["disp"]
        local lk_in_flag,lk_out_flag,abbr_in_flag,abbr_out_flag
        local number_only_flag,out_number_only_flag,out_unit_only_flag=false,false,false

        --[[
            lk判断
        --]]
        if lk=="off" then
            lk_in_flag,lk_out_flag=false,false
        elseif lk=="in" then
            lk_in_flag,lk_out_flag=true,false
        elseif lk=="out" then
            lk_in_flag,lk_out_flag=false,true
        elseif lk=="on" then
            lk_in_flag,lk_out_flag=true,true
        end

        --[[
            abbr判断
        --]]
        if abbr=="off" then
            abbr_in_flag,abbr_out_flag=false,false
        elseif abbr=="in" then
            abbr_in_flag,abbr_out_flag=true,false
        elseif abbr=="out" then
            abbr_in_flag,abbr_out_flag=false,true
        elseif abbr=="on" then
            abbr_in_flag,abbr_out_flag=true,true
        elseif abbr=="values" then
            abbr_in_flag,abbr_out_flag=false,false
            number_only_flag=true
        end

        --[[
            生成单位的输出代码
        --]]
        local inunit_code={}
        for k,v in pairs(in_unit) do
            inunit_code[k]=Convert.link_builder(
                    lk_in_flag,
                    group_name,
                    v,
                    Convert.display_builder(
                        group_name,
                        v,
                        abbr_in_flag
                    )
                )
        end
        local outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,abbr_out_flag))

        --[[
            disp判断输出
        --]]
        local divisionA,divisionB="（","）"
        if disp=="output only" then
            if number_only_flag then
                inunit_code={"",""}
            end
            in_num={"",""}
            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="output number only" then
            inunit_code={"",""}
            in_num={"",""}
            outunit_code=""
            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="b" then--disp=b，默认
            divisionA,divisionB="[","]"
            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="comma" then--disp=comma
            divisionA,divisionB="，",""
            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="x" then --disp=x
            local t_mark=0--存在索引参数有效位数的偏移标记
            if args["sigfig_inindex"]~=nil then--存在则为1
                t_mark=1
            end
            local last_mark=args["last_mark"]
            local t_divisionA,t_divisionB=args[last_mark+t_mark+1],args[last_mark+t_mark+2]--读取倒数最后一到两位（对应disp=x时后两位的位置）
            if t_divsionB==nil then
                t_divsionB=""
            end
            divisionA,divisionB=t_divisionA,t_divisionB

            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="filp" then--disp=filp
            out={out_num,outunit_code,divisionA,in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="unit" then--disp=unit
            if in_num==1 then
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,false))
            else
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,true))
            end
            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        elseif disp=="table" then--disp=table
            local temp=""
            if args["sortable"]~=nil then
                --代替调用{{ntsh}}，效果等价
                temp=string.format([[<span style="display:none">%016.6f</span>]],in_num)
            end
            out={"|",temp,in_num[1],"，",in_num[2],"||",out_num}

            return table.concat(out)
        else
            out={in_num[1],inunit_code[1],in_num[2],inunit_code[2],divisionA,out_num,outunit_code,divisionB}

            return table.concat(out)
        end
    end

    --[[
        处理组合输出1个处理单元
    --]]
    function Convert.bind_1_outtogether(args)
        --锁定锚点
        local mark=args["mark"]

        --初始化数值，单位，转换方法
        local in_num,out_num=tonumber(args[mark-1]),{}
        local in_unit,out_unit,group_name=args[mark],args["outputtogether"],args["group"]
        local function_convert={}
        for k,v in pairs(out_unit) do
            function_convert[k]=Convert.convert_builder(group_name,in_unit,v)
        end

        --换算中
        for k,v in pairs(function_convert) do
            out_num[k]=v(in_num)
        end

        --有效位数计算
        local sigfig=0
        if args["sigfig_inindex"]~=nil then
            sigfig=tonumber(args["sigfig_inindex"])
        elseif args["sigfig"] then
            sigfig=tonumber(args["sigfig"])
        end
        local function_sigfig=Convert.sigfig_func
        if args["disp"]=="5" then
            function_sigfig=Convert.sigfig5_func
        end
        for k,v in pairs(out_unit) do
            out_num[k]=function_sigfig(out_num[k],sigfig)
        end

        --输出
        --输出准备
        local out

        --读取lk，abbr，disp
        local lk,abbr,disp=args["lk"],args["abbr"],args["disp"]
        local lk_in_flag,lk_out_flag,abbr_in_flag,abbr_out_flag
        local number_only_flag,out_number_only_flag,out_unit_only_flag=false,false,false

        --[[
            lk判断
        --]]
        if lk=="off" then
            lk_in_flag,lk_out_flag=false,false
        elseif lk=="in" then
            lk_in_flag,lk_out_flag=true,false
        elseif lk=="out" then
            lk_in_flag,lk_out_flag=false,true
        elseif lk=="on" then
            lk_in_flag,lk_out_flag=true,true
        end

        --[[
            abbr判断
        --]]
        if abbr=="off" then
            abbr_in_flag,abbr_out_flag=false,false
        elseif abbr=="in" then
            abbr_in_flag,abbr_out_flag=true,false
        elseif abbr=="out" then
            abbr_in_flag,abbr_out_flag=false,true
        elseif abbr=="on" then
            abbr_in_flag,abbr_out_flag=true,true
        elseif abbr=="values" then
            abbr_in_flag,abbr_out_flag=false,false
            number_only_flag=true
        end

        --[[
            生成单位的输出代码
        --]]
        local inunit_code=Convert.link_builder(lk_in_flag,group_name,in_unit,Convert.display_builder(group_name,in_unit,abbr_in_flag))
        local outunit_code={}
        for k,v in pairs(out_unit) do
            outunit_code[k]=Convert.link_builder(
                                lk_out_flag,
                                group_name,
                                v,
                                Convert.display_builder(
                                    group_name,
                                    v,
                                    abbr_out_flag
                                )
                            )
        end

        --[[
            disp判断输出
        --]]
        local divisionA,divisionB="（","）"
        if disp=="output only" then
            if number_only_flag then
                inunit_code=""
            end
            in_num=""
            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="output number only" then
            inunit_code=""
            in_num=""
            outunit_code={"",""}
            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="b" then--disp=b，默认
            divisionA,divisionB="[","]"
            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="comma" then--disp=comma
            divisionA,divisionB="，",""
            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="x" then --disp=x
            local t_mark=0--存在索引参数有效位数的偏移标记
            if args["sigfig_inindex"]~=nil then--存在则为1
                t_mark=1
            end
            local last_mark=args["last_mark"]
            local t_divisionA,t_divisionB=args[last_mark+t_mark+1],args[last_mark+t_mark+2]--读取倒数最后一到两位（对应disp=x时后两位的位置）
            if t_divsionB==nil then
                t_divsionB=""
            end
            divisionA,divisionB=t_divisionA,t_divisionB

            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="filp" then--disp=filp
            out={out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionA,in_num,inunit_code,divisionB}

            return table.concat(out)
        elseif disp=="unit" then--disp=unit
            if in_num==1 then
                for k,v in pairs(out_unit) do
                    outunit_code[k]=Convert.link_builder(
                                        lk_out_flag,
                                        group_name,
                                        v,
                                        Convert.display_builder(
                                            group_name,
                                            v,
                                            false
                                        )
                                    )
                end
            else
                for k,v in pairs(out_unit) do
                    outunit_code[k]=Convert.link_builder(
                                        lk_out_flag,
                                        group_name,
                                        v,
                                        Convert.display_builder(
                                            group_name,
                                            v,
                                            true
                                        )
                                    )
                end
            end
            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        elseif disp=="table" then--disp=table
            local temp=""
            if args["sortable"]~=nil then
                --代替调用{{ntsh}}，效果等价
                temp=string.format([[<span style="display:none">%016.6f</span>]],in_num)
            end
            out={"|",temp,in_num,"||",out_num[1],"，",outunit_code[2]}

            return table.concat(out)
        else
            out={in_num,inunit_code,divisionA,out_num[1],outunit_code[1],"，",out_num[2],outunit_code[2],divisionB}

            return table.concat(out)
        end
    end

    --[[
        处理普通2个处理单元
    --]]
    function Convert.bind_2(args)
        --锁定锚点
        local mark=args["mark"]

        --初始化数值，单位，转换方法
        local in_num,out_num={},{}
        local embellish=args["embellish"]
        local in_unit,out_unit,group_name=args[mark],args[mark+1],args["group"]
        local function_convert=Convert.convert_builder(group_name,in_unit,out_unit)

        --数据初始化
        for i=1,mark,2 do
            local key=#in_num+1
            in_num[key],out_num[key]=args[i],0
        end

        --换算中
        for k,v in pairs(in_num) do
            out_num[k]=function_convert(v)

        end

        --有效位数计算
        local sigfig=0
        if args["sigfig_inindex"]~=nil then
            sigfig=tonumber(args["sigfig_inindex"])
        elseif args["sigfig"] then
            sigfig=tonumber(args["sigfig"])
        end
        local function_sigfig=Convert.sigfig_func
        if args["disp"]=="5" then
            function_sigfig=Convert.sigfig5_func
        end
        for k,v in pairs(out_num) do
            out_num[k]=function_sigfig(v,sigfig)
        end

        --输出
        --输出准备
        local out={}

        --读取lk，abbr，disp
        local lk,abbr,disp=args["lk"],args["abbr"],args["disp"]
        local lk_in_flag,lk_out_flag,abbr_in_flag,abbr_out_flag
        local number_only_flag,out_number_only_flag,out_unit_only_flag=false,false,false

        --[[
            lk判断
        --]]
        if lk=="off" then
            lk_in_flag,lk_out_flag=false,false
        elseif lk=="in" then
            lk_in_flag,lk_out_flag=true,false
        elseif lk=="out" then
            lk_in_flag,lk_out_flag=false,true
        elseif lk=="on" then
            lk_in_flag,lk_out_flag=true,true
        end

        --[[
            abbr判断
        --]]
        if abbr=="off" then
            abbr_in_flag,abbr_out_flag=false,false
        elseif abbr=="in" then
            abbr_in_flag,abbr_out_flag=true,false
        elseif abbr=="out" then
            abbr_in_flag,abbr_out_flag=false,true
        elseif abbr=="on" then
            abbr_in_flag,abbr_out_flag=true,true
        elseif abbr=="values" then
            abbr_in_flag,abbr_out_flag=false,false
            number_only_flag=true
        end

        --[[
            生成单位的输出代码
        --]]
        local inunit_code=Convert.link_builder(lk_in_flag,group_name,in_unit,Convert.display_builder(group_name,in_unit,abbr_in_flag))
        local outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,abbr_out_flag))

        --[[
            disp判断输出
        --]]
        local divisionA,divisionB="（","）"
        if disp=="output only" then
            if number_only_flag then
                inunit_code=""
            end
            in_num={}
            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="output number only" then
            inunit_code=""
            in_num={}
            outunit_code=""
            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="b" then--disp=b，默认
            divisionA,divisionB="[","]"
            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<=#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<=#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="comma" then--disp=comma
            divisionA,divisionB="，",""
            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="x" then --disp=x
            local t_mark=0--存在索引参数有效位数的偏移标记
            if args["sigfig_inindex"]~=nil then--存在则为1
                t_mark=1
            end
            local last_mark=args["last_mark"]
            local t_divisionA,t_divisionB=args[last_mark+t_mark+1],args[last_mark+t_mark+2]--读取倒数最后一到两位（对应disp=x时后两位的位置）
            if t_divsionB==nil then
                t_divsionB=""
            end
            divisionA,divisionB=t_divisionA,t_divisionB

            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="filp" then--disp=filp
            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="unit" then--disp=unit
            if in_num==1 then
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,false))
            else
                outunit_code=Convert.link_builder(lk_out_flag,group_name,out_unit,Convert.display_builder(group_name,out_unit,true))
            end

            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        elseif disp=="table" then--disp=table
            local temp=""
            if args["sortable"]~=nil then
                --代替调用{{ntsh}}，效果等价
                temp=string.format([[<span style="display:none">%016.6f</span>]],in_num[1])
            end

            table.insert(out,"|")
            table.insert(out,temp)
            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end

            table.insert(out,"||")
            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end

            return table.concat(out)
        else
            for k,v in pairs(in_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,inunit_code)
            table.insert(out,divisionA)

            for k,v in pairs(out_num) do
                table.insert(out,v)
                if k<#embellish then
                    table.insert(out,embellish[k])
                end
            end
            table.insert(out,outunit_code)
            table.insert(out,divisionB)

            return table.concat(out)
        end
    end

    --[[
        处理普通3个处理单元
    --]]
    function Convert.bind_3(args)
        return Convert.bind_2(args)
    end

    --[[
        处理普通4个处理单元
    --]]
    function Convert.bind_4(args)
        return Convert.bind_2(args)
    end

function Convert.main(frame)
    local args=Convert.init(frame)

    args=Convert.cheak(args)

    return Convert.select(args)
end

return Convert
