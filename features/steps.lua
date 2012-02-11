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

server_directory_index = 0
step('I have an empty configuration', 
	 function(step)
		server_directory_index = server_directory_index + 1
		local output_path = os.getenv('LEASH_TEST_OUTPUT_PATH')
		posix.setenv('LEASH_CONFIG_PATH', output_path .. '/server.' .. server_directory_index)
		assert_equal(os.execute('leash initialize_configuration'), 0)
	 end)

step('I start leash', 
	 function(step)
		assert_equal(os.execute('leash start'), 0)
	 end)

step('"(.*)" should be running', 
	 function(step, process_name)
		assert_equal(os.execute('ps -eo args | cut -f1 -d" " | grep ' .. process_name .. '| grep -qv grep'), 0)
	 end)

step('I should be able to stop leash', 
	 function(step)
		assert_equal(os.execute('leash stop'), 0)
	 end)
