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

local function exec(command)
   return os.execute(command .. ' 2>&1 1>>' .. leash_test_output_path .. 'test.log')
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
		-- grab the command name and first argument so that interpreters will be matched.
		assert_equal(exec('ps -eo args | cut -f1,2 -d" " | grep ' .. process_name .. '| grep -qv grep'), 0)
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
