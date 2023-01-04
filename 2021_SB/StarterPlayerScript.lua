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
		share = {
			comm = {'share'},
			func = function()

			end,
		},
		httpnewlocal = {
			comm = {'httpnewlocal', 'hnl'},
			func = function()

			end,
		},
		newlocal = {
			comm = {'newlocal','nl'},
			func = function()

			end,
		},
		createlocal = {
			comm = {'createlocal','cl'},
			func = function()

			end,
		},
		save = {
			comm = {'save'},
			func = function(script_name)

			end,
		},
		remove = {
			comm = {'remove'},
			func = function()

			end,
		},
		http = {
			comm = {'http','h'},
			func = function()

			end,
		},
		insert = {
			comm = {'insert','i'},
			func = function()

			end,
		},
		run = {
			comm = {'run','r'},
			func = function()

			end,
		},
		runlocalto = {
			comm = {'runlocalto','rlt'},
			func = function()

			end,
		},
		rename = {
			comm = {'rename'},
			func = function()

			end,
		},
		createsource = {
			comm = {'createsource','cl'},
			func = function()

			end,
		},
		runnew = {
			comm = {'runnew','rn'},
			func = function()

			end,
		},
		edithttp = {
			comm = {'edithttp','createh','ch'},
			func = function()

			end,
		},
		local_script_execute = {
			comm = {'local','l','x'},
			func = function(code)
				local status, response = pcall(function() return generate_script.local_s(code) end)
				print(status, response)
				return status, response
			end,
		},
		edit = {
			comm = {'edit'},
			func = function()

			end,
		},
		runlocal = {
			comm = {'runlocal','runl','rl'},
			func = function()
			end,
		},
		stop = {
			comm = {'stop'},
			func = function(script_name)

			end,
		},
		script_execute = {
			comm = {'script','c','do'},
			func = function(code)
				local status, response = pcall(function() return generate_script.s(code) end)
				print(status, response)
				return status, response
			end,
		},
		unsave = {
			comm = {'unsave'},
			func = function()

			end,
		},
		httplocal = {
			comm = {'httplocal','httpl','hl'},
			func = function(code)
				local status, response = pcall(function() return generate_script.local_s(code) end)
				print(status, response)
				return status, response
			end,
		},
		create = {
			comm = {'create'},
			func = function(script_name)

			end,
		},
		get = {
			comm = {'get','g'},
			func = function(code)
				local post_commands = {
					walls = {
						comm = {'walls','wall','wl','w'},
						func = function()
							
						end,	
					},
					cmd = {
						comm = {'cmd','cmds','help'},
						func = function()
							print("Lol help")
						end,
					},
					nobase = {
						comm = {'nobase', 'nb'},
						func = function()
							
						end,
					},
					nil_command = {
						comm = {'nil'},
						func = function()
							
						end,
					},
					prisb = {
						comm = {'prisb'},
						func = function()
							
						end,
					},
					nolocal = {
						comm = {'nolocal','nol','nl'},
					},
					teleport = {
						comm = {'teleport','tp'},
						func = function(characterA, characterB)
						end,
					},
					notools = {
						comm = {'notools','not','nt'},
						func = function()
						end,
					},
					mods = {
						comm = {'mods','modlist','admins'},
						func = function()
							
						end,
					},
					fixcamera = {
						comm = {'fixcamera','fixcam','fixc','fc'},
						func = function()
							
						end,
					},
					r15dummy = {
						comm = {'r15dummy','rdum','rd'},
						func = function()
							
						end,
					},
					rejoin = {
						comm = {'rejoin','rj'},
						func = function(player)
						end,
					},
					sreset = {
						comm = {'sreset','posrespawn','sr'},
						func = function(character)
						end,
					},
					nonils = {
						comm = {'nonils','nonil','nn'},
						func = function()
							
						end,
					},
					encoderequire = {
						comm = {'encoderequire'},
						func = function()
							
						end,
					},
					clearterrain = {
						comm = {'clearterrain','cleart','cleant','ct'},
						func = function()
							
						end,
					},
					banneds = {
						comm = {'banneds','banned'},
						func = function()
							
						end,
					},
					debug_cmd = {
						comm = {'debug','db'},
						func = function()

						end,
					},
					nosounds = {
						comm = {'nosounds','nosound'},
						func = function()
							
						end,
					},
					blocklist = {
						comm = {'blocklist','blocked'},
						func = function()
							
						end,
					},
					pselector = {
						comm = {'pselector','selector','ptargeter','targeter','pt'},
						func = function()
							
						end,
					},
					ps = {
						comm = {'ps','pri'},
						func = function(server_name)
						end,

					},
					blockedassetlist = {
						comm = {'blockedassetlist','bal'},
						func = function()
							
						end,
					},
					noguis = {
						comm = {'noguis','nog','ng'},
						func = function()
							
						end,
					},
					noscripts = {
						comm = {'noscripts','nos','ns'},
						func = function()
							
						end,
					},
					switch = {
						comm = {'switch','sw'},
						func = function()
							
						end,
					},
					fixcharacter = {
						comm = {'fixcharacter','fixchar'},
						func = function()
							
						end,
					},
					noleaderboard = {
						comm = {'noleaderboard','nolb'},
						func = function()
						end,
					},
					ball = {
						comm = {'ball','bl'},
						func = function()

						end,
					},
					nowalls = {
						comm = {'nowalls','nowall','nwl','nw'},
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
					fixlighting = {
						comm = {'fixlighting','fixl','fl'},
						func = function()
						end,
					},
					noteams = {
						comm = {'noteams'},
						func = function()
							
						end,
					},
					walkspeed = {
						comm = {'walkspeed','speed','ws'},
						func = function(speed)
							
						end,
					},
					publicsb = {
						comm = {'publicsb','pubsb'},
						func = function()
							
						end,
					},
					requirelist = {
						comm = {'requirelist','rl','requireallowlist'},
						func = function()
							
						end,
					},
					emojis = {
						comm = {'emojis'},
						func = function()
							
						end,
					},
					reset = {
						comm = {'reset','respawn','r'},
						func = function(player)
							local success, output = pcall(function()
								player:LoadCharacter()
							end)
						end,
					},
					forcefield = {
						comm = {'forcefield','ff'},
						func = function(ff_type)
						end,
					},
					clean = {
						comm = {'clean','c'},
						func = function()

						end,
					},
					fly = {
						comm = {'fly','f'},
						func = function(character)
						end,
					},
					network = {
						comm = {'network','net'},
						func = function()
							
						end,
					},
					blockedownerlist = {
						comm = {'blockedownerlist','bol'},
						func = function()
							
						end,
					},
					noquicks = {
						comm = {'noquicks','noquick','noq','nq'},
						func = function()
							
						end,
					},
					join = {
						comm = {'join'},
						func = function()
							
						end,
					},
					buildtools = {
						comm = {'buildtools','btools','bt'},
						func = function()
							
						end,
					},
					dummy = {
						comm = {'dummy','dum','d'},
						func = function()
							
						end,
					},
					base = {
						comm = {'base','b'},
						func = function()

						end,
					},
				} 
			end,
		},
		sb = {
		},
		
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
