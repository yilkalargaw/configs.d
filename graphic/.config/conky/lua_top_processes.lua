function conky_top_processes()
    if conky_window == nil then return "" end

    local output = ""
    local max_procs = 6 -- number of top processes to show

    for i = 1, max_procs do
        local name = conky_parse(string.format("${top name %d}", i))
        local cpu = conky_parse(string.format("${top cpu %d}", i))
        local mem = conky_parse(string.format("${top mem %d}", i))
        if name == "" then break end
        output = output .. string.format("%s%s%s%s%s%s\n",
            name,
            string.rep(" ", 20 - #name),
            cpu .. "%",
            string.rep(" ", 7 - #cpu),
            mem .. "%",
            ""
        )
    end

    return output
end

function conky_cpu_core_graphs()
    if conky_window == nil then return "" end

    local colors = {"#61afef", "#c678dd", "#56b6c2", "#ff79c6"}
    local output = ""

    for i = 1, 4 do
        local graph_str = string.format("${cpugraph cpu%d 15,60 %s #3b4252}", i, colors[i])
        output = output .. conky_parse(graph_str) .. "\n"
    end

    return output
end
