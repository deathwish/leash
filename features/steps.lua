require 'calabash'
local posix = require 'posix'

-- telescope 0.4 does not correctly alias all of the global functions it calls,
-- thus calabash environment rebinding causes running tests to fail.
-- TODO: fix this correctly.
telescope.pcall = pcall
telescope.debug = debug
telescope.tostring = tostring
telescope.unpack = unpack
telescope.error = error

local leash_test_output_path = os.getenv('LEASH_TEST_OUTPUT_PATH') .. '/'
local leash_test_output_log = leash_test_output_path .. 'test.log'

local exec_command_output = ''
local function exec(command)
   -- FIXME Lua <= 5.1.x lameness, close on an io.popen io doesn't return the exit status.
   local pipe = assert(io.popen(command .. ' ; echo "exit status: ${?}"', 'r'))
   local output = assert(pipe:read('*all'))
   assert(pipe:close())
   
   -- log command output, including exit status output
   local logfile = assert(io.open(leash_test_output_log, 'a'))
   assert(logfile:write(output))
   assert(logfile:close())

   -- parse exit status and remove it from the command output
   local s, e, exit_status = assert(output:find('exit status: (%d+)\n$'))
   exec_command_output = output:sub(1, s - 1)

   return exit_status + 0
end

local function process_is_running(process_name)
   -- grab the command name and first argument so that interpreters will be matched.
   return exec('ps -eo args | cut -f1,2 -d" " | grep ' .. process_name .. '| grep -qv grep') == 0
end

local server_directory_index = 0
step('I have an empty configuration',
	 function(step)
		server_directory_index = server_directory_index + 1
		test_config_path = leash_test_output_path .. '/server.' .. server_directory_index
		posix.setenv('LEASH_CONFIG_PATH', test_config_path)
		assert_equal(exec('leash initialize_configuration'), 0)
	 end)

step('I start leash',
	 function(step)
		assert_equal(exec('leash start'), 0)
		-- wait for leash to come up before executing further tests.
		posix.sleep(3)
	 end)

step('"(.*)" should be running',
	 function(step, process_name)
		assert_true(process_is_running(process_name))
	 end)

step('"(.*)" should not be running',
	 function(step, process_name)
		assert_false(process_is_running(process_name))
	 end)

step('I should be able to stop leash',
	 function(step)
		assert_equal(exec('leash stop'), 0)
		-- wait for leash to shutdown before running more tests.
		posix.sleep(1)
	 end)

step('I have added a process named "(.*)" running the command "(.*)"',
	 function(step, process_name, command_line)
		assert_equal(exec("leash add_process " .. process_name .. " '" .. command_line .. "'"), 0)
	 end)

step('I remove the process named "(.*)"',
	 function(step, process_name)
		assert_equal(exec("leash remove_process " .. process_name), 0)
	 end)

step('I list leash processes',
	 function(step)
		assert_equal(exec('leash list_processes'), 0)
	 end)

step('I should see "(.*)"',
     function(step, output)
        assert_match(output, exec_command_output)
     end)

step('I should not see "(.*)"',
     function(step, output)
        assert_not_match(output, exec_command_output)
     end)
