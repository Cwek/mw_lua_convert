local Convect={}

--����
local Convect.group_name={"length","area","volume","speed","force","energy","temperature","mass","torque"}
--��׼��λ
local Convect.baseunit={"m","m2","m3","m/s","N","J","K","kg","Nm"}
--��������
local Convect_Date=mw.loadData("ģ��:ɳ��/cwek/Convert/data")

--�ر�����--
--֧��2ֵ�㵥ֵ�ĵ�λ
local Convect.input_sepceil={
                            ["ft"]={{"ft","in"}},
                            ["st"]={{"st","lb"}},
                            ["lb"]={{"lb","oz"}}
                            }
--֧����������λ��
--{��λ={����ĵ�λ,...},...}
local Convect.output_together={
                            --����
                            ["km"]={"mi"},
                            ["m"]={"ft","ftin"},
                            ["cm"]={"in"},
                            ["mm"]={"in"},
                            ["mi"]={"km"},
                            ["ft"]={"m"},
                            ["in"]={"cm","mm"},
                            --���
                            ["km2"]={"sqmi"},
                            ["m2"]={"sqft"},
                            ["cm2"]={"sqin"},
                            ["mm2"]={"sqin"},
                            ["sqmi"]={"km2"},
                            ["sqft"]={"m2"},
                            ["sqfoot"]={"m2"},
                            ["sqin"]={"cm2"},
                            --���
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
                            --�ٶ�
                            ["m/s"]={"ft/s","foot/s"},
                            ["km/h"]={"mph"},
                            ["mph"]={"km/h","kn"},
                            ["ft/s"]={"m/s"},
                            ["kn"]={"mph"},
                            --����
                            ["GN"]={"LT-f","LTf","ST-f","STf"},
                            ["MN"]={"LT-f","LTf","ST-f","STf"},
                            ["kN"]={"LT-f","LTf","ST-f","STf"},
                            ["N"]={"lb-f","lbf","oz-f","ozf"},
                            ["mN"]={"oz-f","ozf","gr-f","grf"},
                            ["��N"]={"gr-f","grf"},
                            ["uN"]={"gr-f","grf"},
                            ["nN"]={"gr-f","grf"},
                            ["LT-f"]={"ST-f"},
                            ["LTf"]={"STf"},
                            ["ST-f"]={"LT-f"},
                            ["STf"]={"LTf"},
                            --����

                            --�¶�
                            ["K"]={"��C","��R","��F","C","R","F"},
                            ["��C"]={"K","��R","��F","R","F"},
                            ["C"]={"K","��R","��F","R","F"},
                            ["��R"]={"K","��C","��F","C","F"},
                            ["R"]={"K","��C","��F","C","F"},
                            ["��F"]={"K","��C","��R","C","R"},
                            ["F"]={"K","��C","��R","C","R"},
                            --����
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
                            --����
                            ["Nm"]={"lbft","lbfft"}
}
--�¶Ȳ��
local Convect.temperature_range={"C-change","F-change"}

--2+��Ԫ���δ�
local Convect.range_embellish_key={"to","and","or","-"}
local Convect.range_embellish_val={"��","��","��","-"}

--�ӷ�����ʼ--
function Convect.unit_check__(unit)--��λ��鹤��
	local flag=false
	local group=nil

	if(tonumber(unit)~=nil)then
		return group,flag
	end

	for group_name in Convect.group_name do
		for unit_name in Convect.value[group_name] do
			if unit_name==unit then
				group=group_name
				flag=true

				return group,flag
			end
		end
	end

	return group,flag
end

function Convect.unit_convect_value(group,unit)--��λת��ֵ����
    local value=Convect.value[group][unit]

    return value
end

function Convert.embellish_binder__(input)--���δʽ�����
    local k=Convert.embellish_cheaker__(input)
    if k>0 then
        return Convert.range_embellish_val[k]
    else
        return input
    end
end

function Convert.embellish_cheaker__(input)--���δ���Ѱ�ߣ����ַ���ת�������δʣ����ؼ�ֵ�����򷵻�-1
    for k,v in pairs(Convert.range_embellish_key) do
        if v==input then
            return k
        end
    end

    return -1
end

function Convert.link_finder__(group,unit)--��λ����ֵ����
    for k,v in pairs(Convert.link[group]) do
        local linkname=k
        for t in v do
            if unit==t then
                return linkname
            end
        end
    end
    return false
end

function Convert.link_builder__(flag,group,unit,display)--��λ����ֵ����
    local code=""
    local t=link_finder__(group,unit)

    if(flag and t~=false)then
        return code="[["..t.."|"..display.."]]"
    else
        return code=display
    end
end

function Convert.display_builder__(group,unit,flag)--��λ��ʾֵ���죨����ȫ�ƻ�������
    local code=""
    local t_arr=Convert.display[group][unit]

    if((not flag) or t_arr[2]~=nil)then
       return t_arr[1]
    else
       return t_arr[2]
    end
end

function Convert.base_unit__(group)--�����������Ļ�׼��λ
    for k,v in pairs(Convert.group_name) do
        if v==group then
            return Convert.baseunit[k]
        end
    end

    return false
end

function Convert.sigfig_func(input,sigfig)--ȡ��
    local t,_=math.modf(input*math.pow(10,sigfig)+0.5)

    if(sigfig<0)
        return (string.format("%."..math.abs(sigfig).."f",(t/math.pow(10,sigfig))))
    else
        return (t/math.pow(10,sigfig))
    end
end
    
function Convert.sigfig5_func(input)--ȡ5��
    local t=sigfig_func(input,0)
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

function Convert.convert(group,in_unit,out_unit)--ת���������캯��
    local a_t=Convect.value[group][in_unit]
    local b_t=Convect.value[group][out_unit]

    if type(a_t)=="number" and type(b_t)=="number" then--�������ͨ�������¶��ࣩ
        local a,b=a_t,b_t
        return function(input) return input*a/b end
    else--�¶���Ĵ���
        local a_K,K_b=a_t[1],a_t[2]
        return function(input) return K_b(a_K(input)) end
    end
end

--��������ʼ--
function Convect.init__(frame)--���������ʼ�����Ͳ��ּ򵥲������趨
    local args_from_templatein=frame:getParent().args
    local args_from_invokein=frame.args

    --��ʼ���ؾ�
    args={}

    --����ȫ����������
    local lk=((args_from_templatein["lk"]~=nil and args_from_templatein["lk"]) or "off")
    local abbr=((args_from_templatein["abbr"]~=nil and args_from_templatein["abbr"]) or "off")
    local disp=((args_from_templatein["disp"]~=nil and args_from_templatein["disp"]) or "b")
    local sigfig=args_from_templatein["sigfig"]
    local sortable=args_from_templatein["sortable"]

    --����ִ�еı�ѡ����
    local ismore=tonumber(args_from_invokein[1])
    args["processCount"]=ismore

    --��ʼ�����ش�����������������
    args["args"]={}
    local i=1
    while true do--����ȫ��������������Ϊframe.argsΪ����ȫ���޷�֪̽Ԫ�ظ���������ѭ��֪̽����
        t=args[i]
        if t~=nil then
            args.args[i]=t
        else
            break
        end
    end

    --����lk
    args["link_in"]=false
    args["link_out"]=false
    if lk~=nil then
        local switch_link={}
        switch_link["off"]=function() end
        switch_link["in"]=function() args["link_in"]=true end
        switch_link["out"]=function() args["link_out"]=true end

        switch_link[lk]()
    end--lk done

    --����abbr
    args["display_shortin"]=false
    args["display_shortout"]=false
    args["display_valonly"]=false
    if abbr~=nil then
        local switch_abbr={}
        switch_abbr["on"]=function()  args["display_shortin"]=true args["display_shortout"]=true end
        switch_abbr["off"]=function()  end
        switch_abbr["in"]=function() args["display_shortin"]=true end
        switch_abbr["out"]=function() args["display_shortout"]=true end
        switch_abbr["values"]=function() args["display_valonly"]=true end

        switch_abbr[abbr]()
    end--abbr done

    --����sigfig
    if sigfig~=nil then
        local t=tonumber(sigfig)
        if t~=nil and t>0 then
            args["sigfig"]=t
        else
            args["sigfig"]=3
        end
        args["have_sigfig"]=true
    else
        args["have_sigfig"]=false
    end--sigfig ��������done

    --����sortable
    if sortable~=nil then
        args["sortable"]=true
    end--sortable ����done

    --����disp��disp�����ӣ���cheak__���
    if disp~=nil then
        args["disp"]=disp
		args["have_sigfig"]=true
    else
        args["disp"]="b"
    end--disp ����done


    return args
end

function Convect.cheak__(args)
    --[[
    ����ʱargs�����У�
    [args]:�������������
    [processCount]<3,4��nil>:Ҫ����ĵ�Ԫ��
    [link_in],[link_out]:�����Ƿ����ɵ�λ����
    [display_shortin],[display_shortout],[display_valonly]:���Ƶ�λ��ʾ����
    [sigfig]:��Чλ��
    [disp]:�����disp
    [sortable]:�����sortable
    [have_sigfig]=����sigfig
    --]]

    --������������������������жϴ���Ԫ��
    local t_processCount=0
    if tonumber(args.args[1])~=nil--����1����Ԫ
        t_processCount=1
    elseif tonumber(args.args[3])~=nil--����2����Ԫ
        t_processCount=2

        --������2ת1�������ҳ�ƥ����
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
        if find_in_inputSepceil(args.args[2],args.args[4]) then--�������2������4��2ת1�����У��Ļش���1����Ԫ
            args["2in1"]=true
            t_processCount=1
        else
            args["2in1"]=false
        end

        --�¶�ת�����
        local find_temperatureChange=function(input1)
            for v in Convect.temperature_range do
                if input1==v then
                    return true
                end
            end
            return false
        end
        if find_temperatureChange(args.args[2]) then--�������2���ض����¶�ת���������Ļش���1����Ԫ
            t_processCount=1
            args["t_c"]=true
        else
            args["t_c"]=false
        end
    elseif tonumber(args.args[5])~=nil and args["processCount"]==3 then--����3����Ԫ
        t_processCount=3
    elseif tonumber(args.args[7])~=nil and args["processCount"]==4 then--����4����Ԫ
        t_processCount=4
    end
    args["processCount"]=t_processCount
    --����Ԫ�ж�done

    --����sigfig��disp��صĻ���
    local base=0--��Ӧ�����λλ�õĻ�ֵ
    if args["processCount"]==1 then
        base=3
    elseif args["processCount"]==2 then
        base=5
    elseif args["processCount"]==3 then
        base=7
    elseif args["processCount"]==4 then
        base=9
    end
        if(args["processCount"]==1 and string.find(args.args[base]," "))then--����Ƿ��и�����������ж��Ƿ���пո�
            --����������ϵ�λ�������Ӧ�������з���
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

            local a,b=t_out[1],t_out[2]--��ȡ�������뵥λ
            local flag=false

            for k,v in pairs(Convect.output_together) do--���жԱ�ȷ��
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
            if(not flag)then--���������ϵ�λ
                args.args[base]=a--ֱ���޸Ĳ�������Ϊǰһ����λ
            end

        end
        --args.args

        --�ж���ûʡ�������λ
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
        --����sigfig
        local t_sigfig=args["sigfig"]
        if tonumber(args.args[base])~=nil and (not args["have_sigfig"])then
            t_sigfig=tonumber(args.args[base])
            base=base+1
        elseif args["have_sigfig"] then
            t_sigfig=args["sigfig"]
        end
        args["sigfig"]=t_sigfig
        --disp=x�Ĵ���
        if args["disp"]=="x" then
            args["modelX_a"]=(args.args[base]~=nil and args.args[base])or ""
            args["modelX_b"]=(args.args[base+1]~=nil and args.args[base+1])or ""
        end
    --�������

    --����disp����
    local disp_b_model="%s[%s]"
    args["model"]=disp_b_model


    local switch_disp={}
    switch_disp["b"]=       function()
                                --args["model"]=disp_b_model
                            end
    switch_disp["comma"]=   function()
                                args["model"]="%s��%s"
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
ת���������̸ſ�
in_value[x](in_unit[x])���������ֵ�����뵥λ�����������λ����û���ݵ�λ�������û�׼��λ��
         |             ������ת����ʽ
        \|/
function_convert[x]    ������ֵ
         |
        \|/
out_value[x](out_unit[1])����������ֵ
         |
        \|/
out_value_sum���ϲ��������ֵ
--]]
--[[
args���ܴ������ݣ�
    init���ɵģ�
        [args]:�������������-table
        [processCount]<3,4��nil>:Ҫ����ĵ�Ԫ��-number
        [link_in],[link_out]:�����Ƿ����ɵ�λ����-bool
        [display_shortin],[display_shortout],[display_valonly]:���Ƶ�λ��ʾ����-bool
        [sigfig]:��Чλ��-number
        [disp]:�����disp-string
        [sortable]:�����sortable-bool
        [have_sigfig]������sigfig-bool
    check���ɵģ�
        [2in1]:2ת1���-bool
        [t_c]:�¶ȷ�Χת�����-bool
        [out_unit_miss]:ȱ�������λ���-bool
        [modelX_a],[modelX_b]:disp=x�ı��ģ��-string
        [model]:�����ģ��-string
        [outputOnly]:����ֻ����������-bool,nil
        [out_only_val]:����ֻ�������ֵ���-bool,nil
        [filp]:��ת�������λ�ñ��-bool.nil
        [unitonly]:ֻ������λ������-bool,nil
        [sigfig5]:��5ȡ�����-bool,nil
        [out_unit_instead]:��������λ��ֻ�޴���1����Ԫʱ-table
--]]
function Convert.bind_1__(args)
    local out=""

    local in_value={}
    local out_value={}

    local in_unit={}
    local out_unit={}
    local group_name=""
    local function_convert={}

    --ת��������������
    table.insert(in_value,args.args[1])
    table.insert(in_unit,args.args[2])
    group_name,_=Convert.unit_Convert_value(in_unit[1])
    local baseunit=Convert.base_unit__(group_name)
    table.insert(out_unit,(args.args[3] and args.args[3] )or baseunit)
    if(args["2in1"])then--2ת1������
        table.insert(in_value,args.args[1])
        table.insert(in_unit,args.args[2])
        --table.insert(out_unit,(args.args[3] and args.args[3] )or baseunit)
    end
    if(args["t_c"])then--�¶ȷ�Χת��
        if in_unit[1]=="C-change" then
            in_unit[1]="C"
            out_unit[1]="F"
        elseif in_unit[1]=="F-change" then
            in_unit[1]="F"
            out_unit[1]="C"
        end
        group_name="temperature"
    end
    if(args["unitonly"])then--ֻ���뵥λ��ʾ���,����args["unitonly"]
        out=out..table.concat(in_unit,"��")
        return out
    end
	
	if(not args["out_unit_instead"])then
		for v in in_unit do--���ת��������ʽ<---------<------
			table.insert(function_convert,Convert.convert(v,out_unit[1]))
		end
		
		for k,v in pairs(in_value) do--ת���к�sigfig�Ĵ����args["sigfig5"]
			local t_number=function_convert[k](v)
			
			t_number=Convert.sigfig_func(t_number,args["sigfig"])
			if(args["sigfig5"])then t_number=Convert.sigfig5_func(tonumber(t_number)).."" end
			table.insert(out_value,t_number,k)
		end
		local sum_out_value=0
		for v in out_value do--����
			sum_out_value=sum_out_value+v
		end
	else
		out_unit=args["out_unit_instead"]--args["out_unit_instead"]��ת������
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
	
	--������ʾ�����������������Ʋ���
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
	
	--�����ʾ����
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
