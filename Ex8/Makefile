all: sim

sim:
	@echo "Starting test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode batch -source project.tcl > run.log
	@egrep "PASSED|FAILED|ERROR" run.log|echo "Result: $1"

simgui: 
	@echo "Starting GUI test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode gui -source project.tcl > run.log
	@egrep "PASSED|FAILED|ERROR" run.log |echo "Result: $1"

clean:
	@rm vivado*.* run.log
	@rm -r Ex*.*
