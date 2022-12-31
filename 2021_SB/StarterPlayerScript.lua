print("StarterPlayerScript")


local_player = game.Players.LocalPlayer

owner_string = 'owner'
player_string = tostring('game.Players[['..local_player.Name..']]')
local_player_string = tostring('game.Players.LocalPlayer')

https_string = 'https'

script_folder = {
	scripts = {
		--Scripts will reside here	
	},
	localscripts = {
		--LocalScripts will reside here
	}
}

code_analysis = {
	analyze = {
	}
}

execution = {
	running = function(statys) print(statys) end,
	erroring = function(statys) print(statys[1]) end,
	isHttps = function(txt) 
		return (string.sub(txt, 1, #https_string) == https_string)
	end
}

generate_script = {
	s = function(code)
		local _s = Instance.new("Script")
		if (execution.isHttps(code)) then
			_s.LinkedSource = code
		else			
			_s.Source = code
		end
		_s.Disabled = false
		_s.Parent = workspace
		table.insert(script_folder.scripts, _s)
		return _s
	end,
	local_s = function(code)
		local _ls = Instance.new("LocalScript")
		if (execution.isHttps(code)) then
			_ls.LinkedSource = code
		else			
			_ls.Source = code
		end
		_ls.Disabled = false
		_ls.Parent = local_player.PlayerScripts
		table.insert(script_folder.localscripts, _ls)
		return _ls
	end,
}

commands = {
	pre_commands = {
		run_loadstring_script = {
			comm = {'script','c','do'},
			func = function(code)
				local status, response = pcall(function() return generate_script.s(code) end)
				print(status, response)
				return status, response
			end,
		},
		run_loadstring_local_script = {
			comm = {'local','l','x'},
			func = function(code)
				local status, response = pcall(function() return generate_script.local_s(code) end)
				print(status, response)
				return status, response
			end,
		},
		run_https_script = {
			comm = {'h'},
			func = function(code)
				local status, response = pcall(function() return generate_script.s(code) end)
				print(status, response)
				return status, response
			end,
		},
		run_https_local_script = {
			comm = {'hl'},
			func = function(code)
				local status, response = pcall(function() return generate_script.local_s(code) end)
				print(status, response)
				return status, response
			end,
		},
		get = {
			comm = {'get','g'},
			func = function(code)
				local post_commands = {
					help = {
						comm = {'help'},
						func = function()
							print("Lol help")
						end,
					},
					ball = {
						comm = {'ball','bl'},
						func = function()

						end,
					},
					base = {
						comm = {'base','b'},
						func = function()

						end,
					},
					clean = {
						comm = {'clean','c'},
						func = function()

						end,
					},
					debug_cmd = {
						comm = {'debug','db'},
						func = function()

						end,
					},
					fixlighting = {
						comm = {'fixlighting','fixl','fl'},
						func = function()
						end,
					},
					fly = {
						comm = {'fly','f'},
						func = function(character)
						end,
					},
					forcefield = {
						comm = {'forcefield','ff'},
						func = function(ff_type)
						end,
					},
					gamelist = {
						comm = {'gamelist','games','servers'},
						func = function()
						end,
					},
					noforcefield = {
						comm = {'noforcefield','noff','unff'},
						func = function(ff_type)
							if (ff_type == "retro" or ff_type == "classic") then
								
							else
								
							end
						end,
					},
					noleaderboard = {
						comm = {'noleaderboard','nolb'},
						func = function()
						end,
					},
					ps = {
						comm = {'ps','pri'},
						func = function(server_name)
						end,

					},
					rejoin = {
						comm = {'rejoin','rj'},
						func = function(player)
						end,
					},
					reset = {
						comm = {'reset','r'},
						func = function(player)
							local success, output = pcall(function()
								player:LoadCharacter()
							end)
						end,
					},
					sreset = {
						comm = {'sreset','posrespawn','sr'},
						func = function(character)
						end,
					},
					teleport = {
						comm = {'teleport','tp'},
						func = function(characterA, characterB)
						end,
					},
				} 
			end,
		}
		
	},
	in_line_commands = {
		owner = {
			comm = {owner_string}, 
			func = function(code) string.gsub(code, owner_string, player_string) end
		}
	},
}

function not_command()
	print('not_command')
end

function isCommand(txt)
	for i,v in pairs(commands.pre_commands) do
		for j,w in pairs(v.comm) do
			local command_check = string.sub(txt, 1, #w) == w
			if (command_check) then
				local command_txt = string.sub(txt,#w+2)
				local command_execution = v.func(command_txt)
				print(command_execution)
				return command_execution
			end --if
		end --for j,w
	end --for i,v
end --function

function Chat(msg)
	local status, response = isCommand(msg)
	if (status) then
		print(response)
	end
end

function Connections()
	local_player.Chatted:Connect(Chat)
end

function Main()
	Connections()
end

Main()
